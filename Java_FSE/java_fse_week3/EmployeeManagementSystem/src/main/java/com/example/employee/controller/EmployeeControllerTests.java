package com.example.employee.controller;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.employee.model.Employee;
import com.example.employee.service.EmployeeService;
// import org.mockito.Mockito;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
// import org.springframework.http.MediaType;
// import org.springframework.test.web.servlet.MockMvc;
// import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
// import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

@WebMvcTest(EmployeeController.class)
public class EmployeeControllerTests<MockMvc> {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private EmployeeService employeeService;

    @Test
    public void testGetAllEmployees() throws Exception {
        when(employeeService.findAll()).thenReturn(List.of(new Employee()));

        mockMvc.perform(MockMvcRequestBuilders.get("/employees")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }

    // Add additional tests for other endpoints
}
