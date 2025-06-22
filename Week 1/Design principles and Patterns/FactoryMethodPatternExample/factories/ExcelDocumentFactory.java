package factories;

import documents.Document;
import documents.ExcelDocument;

public class ExcelDocumentFactory extends DocumentFactory {
    public Document createDocument() {
        return new ExcelDocument();
    }
}
