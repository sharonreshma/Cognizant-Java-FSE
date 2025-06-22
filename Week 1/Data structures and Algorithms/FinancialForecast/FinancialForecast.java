public class FinancialForecast {

    public static double forecastRecursive(double initialValue, double growthRate, int years) {
        if (years == 0) {
            return initialValue; 
        }
        return forecastRecursive(initialValue, growthRate, years - 1) * (1 + growthRate);
    }

    public static double forecastIterative(double initialValue, double growthRate, int years) {
        double result = initialValue;
        for (int i = 0; i < years; i++) {
            result *= (1 + growthRate);
        }
        return result;
    }

    public static void main(String[] args) {
 
        double initialInvestment = 50000;    
        double growthRate = 0.20;            
        int years = 6;

        System.out.println("Using Recursive Forecast:");
        double futureRecursive = forecastRecursive(initialInvestment, growthRate, years);
        System.out.printf("Future value after %d years: ₹%.2f\n", years, futureRecursive);
        
        System.out.println();
        
        System.out.println("Using Iterative Forecast(Optimized Method):");
        double futureIterative = forecastIterative(initialInvestment, growthRate, years);
        System.out.printf("Future value after %d years: ₹%.2f\n", years, futureIterative);
        
        System.out.println();

        System.out.println("Time and Space Complexity Analysis:");
        System.out.println("Recursive Forecast: Time is O(n), Space is O(n)");
        System.out.println("Iterative Forecast: Time is O(n), Space is O(1)");
    }
}
