package factories;

import documents.Document;
import documents.WordDocument;

public class WordDocumentFactory extends DocumentFactory {
    public Document createDocument() {
        return new WordDocument();
    }
}
