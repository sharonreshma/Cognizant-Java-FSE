public class Main {
    public static void main(String[] args) {
        Product[] products = {
            new Product(1, "Handbags", "Accessories"),
            new Product(2, "Perfumes", "Cosmetics and Beauty"),
            new Product(3, "Laptop", "Electronics"),
            new Product(4, "Teaspoons", "Cutlery")
        };

        System.out.println("Linear Search for 'Perfumes':");
        Product result1 = Search.linearSearch(products, "Perfumes");
        System.out.println("ProductId - ProductName - Category");
        System.out.println(result1 != null ? result1 : "Product not found");
        
        System.out.println();
        
        System.out.println("Binary Search for 'Perfumes':");
        Product result2 = Search.binarySearch(products, "Perfumes");
        System.out.println("ProductId - ProductName - Category");
        System.out.println(result2 != null ? result2 : "Product not found");
        
        System.out.println();

        System.out.println("Analysis:");
        System.out.println("Linear Search: Time Complexity is O(n)");
        System.out.println("Binary Search: Time Complexity is O(log n) After Sorting");
        System.out.println("Binary Search is more efficient for large, sorted datasets.");
    }
}
