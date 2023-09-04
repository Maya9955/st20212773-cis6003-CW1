package com.code.onlineappoiment.service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import java.sql.SQLException;
import java.util.List;
import com.code.onlineappoiment.model.Appoiment;

class AppoimentServiceTest {
	
	 private AppoimentService appoimentService;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	@BeforeEach
	 void setUp() {
        appoimentService = AppoimentService.getAppoimentService();
        }

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	void testGetAppoimentService() {
	    // Arrange: Create an instance of AppoimentService
	    AppoimentService appoimentService = AppoimentService.getAppoimentService();

	    // Act: Call the getAppoimentService method
	    AppoimentService result = AppoimentService.getAppoimentService();

	    // Assert: Check if the result is not null and is the same as the original instance
	    assertNotNull(result, "AppoimentService should not be null");
	    assertSame(appoimentService, result, "Should return the same instance");

	    // Additional assertions or tests specific to your use case can be added here.
	}

	@Test
	void testAddAppoiment() {
		Appoiment appoiment = new Appoiment(); // Create an appoiment object with appropriate data
        try {
            boolean result = appoimentService.addAppoiment(appoiment);
            assertTrue(result, "Add appoiment should return true");
        } catch (ClassNotFoundException | SQLException e) {
            fail("Exception thrown while adding appoiment: " + e.getMessage());
        }
    }

	@Test
	void testEditAppoiment() {
	    // Arrange: Prepare test data
	    Appoiment appoimentToUpdate = new Appoiment();
	    appoimentToUpdate.setidappoiment(26);  // Replace with a valid appointment ID
	    appoimentToUpdate.setName("Updated Name");
	    appoimentToUpdate.setemail_id("updated@example.com");
	    appoimentToUpdate.setph_no("1234567890");
	    appoimentToUpdate.setdate("2023-09-05");
	    appoimentToUpdate.setstatus("Approve by No: 7 - Counselor ");

	    // Act: Call the editAppoiment method
	    try {
	        boolean result = appoimentService.editAppoiment(appoimentToUpdate);

	        // Assert: Check if the update was successful
	        assertTrue(result, "Edit appoiment should return true");

	        // Optionally, fetch the appointment again and check if the fields match
	        Appoiment updatedAppointment = appoimentService.fetchSingleAppoiment(appoimentToUpdate.getidappoiment());
	        assertNotNull(updatedAppointment, "Updated appointment should not be null");
	        assertEquals("Updated Name", updatedAppointment.getName());
	        assertEquals("updated@example.com", updatedAppointment.getemail_id());
	        assertEquals("1234567890", updatedAppointment.getph_no());
	        assertEquals("2023-09-05", updatedAppointment.getdate());
	        assertEquals("Approve by No: 7 - Counselor ", updatedAppointment.getstatus());

	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace(); // Print the exception details for debugging
	        fail("Exception thrown while editing appoiment: " + e.getMessage());
	    }
	}


	@Test
	void testDeleteAppoiment() {
	    int idappoiment = 28; // Replace with a valid appoiment ID
	    try {
	        boolean result = appoimentService.deleteAppoiment(idappoiment);
	        assertTrue(result, "Delete appoiment should return true");
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace(); // Print the exception details
	        fail("Exception thrown while deleting appoiment: " + e.getMessage());
	    }
	}

	@Test
	void testFetchSingleAppoiment() {
		 int idappoiment = 1; // Replace with a valid appoiment ID
	        try {
	            Appoiment appoiment = appoimentService.fetchSingleAppoiment(idappoiment);
	            assertNotNull(appoiment, "Fetch single appoiment should return a non-null object");
	        } catch (ClassNotFoundException | SQLException e) {
	            fail("Exception thrown while fetching single appoiment: " + e.getMessage());
	        }
	    }

	@Test
	void testFetchAllAppoiment() {
        try {
            List<Appoiment> appoiments = appoimentService.fetchAllAppoiment();
            assertNotNull(appoiments, "Fetch all appoiments should return a non-null list");
            assertTrue(!appoiments.isEmpty(), "Fetched appoiment list should not be empty");
        } catch (ClassNotFoundException | SQLException e) {
            fail("Exception thrown while fetching all appoiments: " + e.getMessage());
        }
    }

}
