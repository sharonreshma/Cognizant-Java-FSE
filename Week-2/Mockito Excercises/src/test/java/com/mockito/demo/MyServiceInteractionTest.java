package com.mockito.demo;

import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;

public class MyServiceInteractionTest {

    @Test
    public void testVerifyInteraction() {
        ExternalApi mockApi = mock(ExternalApi.class);
        MyService service = new MyService(mockApi);
        service.fetchData2();
        verify(mockApi).getData(); // verifying interaction
    }
}
