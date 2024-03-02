# CLI Tool to Extract Top N Rows from a CSV File

# Check if at least the input file path is provided
if ($args.Length -lt 1) {
    Write-Output "Usage: ExtractCsvSample.ps1 <InputFilePath> [NumberOfRows]"
    exit
}

# Get the input file path from the first argument
$inputFilePath = $args[0]

# Set default number of rows to extract (including header), adjust if necessary
$numberOfRows = 15001

# If a second argument is provided, use it as the number of rows to extract
if ($args.Length -ge 2) {
    $numberOfRows = [int]$args[1] + 1  # Adding 1 to include the header row in the count
}

# Generate the output file path by appending "_SAMPLE" before the file extension
$outputFilePath = $inputFilePath -replace "\.csv$", "_SAMPLE.csv"

# Use Get-Content to read the file and select the first N lines
# Then use Set-Content to write these lines to the new file
Get-Content $inputFilePath -Head $numberOfRows | Set-Content $outputFilePath

# Output the path to the new file
Write-Output "Sample file created at: $outputFilePath"
