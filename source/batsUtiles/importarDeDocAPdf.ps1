$documents_path = Get-Location

$word_app = New-Object -ComObject Word.Application

# Funcion recursiva para buscar archivos doc y docx en todas las subcarpetas
function SearchAndConvertDocuments($path) {
    Get-ChildItem -Path $path -Filter *.doc? -File | ForEach-Object {
        $document = $word_app.Documents.Open($_.FullName)
        $pdf_filename = "$($_.DirectoryName)\$($_.BaseName).pdf"
        $document.SaveAs([ref] $pdf_filename, [ref] 17)
        $document.Close()
    }
    
    Get-ChildItem -Path $path -Directory | ForEach-Object {
        SearchAndConvertDocuments $_.FullName
    }
}

# Llamada inicial a la funcion recursiva
SearchAndConvertDocuments $documents_path

$word_app.Quit()
