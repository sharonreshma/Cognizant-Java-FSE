package com.mockito.demo;

public class MyService {
    private ExternalApi api;

    public MyService(ExternalApi api) {
        this.api = api;
    }

    public String fetchData() {
        return api.getData();
    }

    //Exercise-2 verification for interaction
     public void fetchData2() {
        api.getData(); 
    }
    
     
}
