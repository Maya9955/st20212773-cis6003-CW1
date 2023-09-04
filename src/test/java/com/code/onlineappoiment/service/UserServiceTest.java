package com.code.onlineappoiment.service;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.code.onlineappoiment.model.User;

class UserServiceTest {
	
	private UserService userService;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	@BeforeEach
	void setUp() throws Exception {
	    // Initialize the userService here
	    userService = new UserService(); // Adjust the constructor as needed
	}

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	void testGetUserService() {
		  // Arrange: Create an instance of AppoimentService
	    UserService appoimentService = UserService.getUserService();

	    // Act: Call the getAppoimentService method
	    UserService result = UserService.getUserService();

	    // Assert: Check if the result is not null and is the same as the original instance
	    assertNotNull(result, "UserService should not be null");
	    assertSame(appoimentService, result, "Should return the same instance");

	    // Additional assertions or tests specific to your use case can be added here.
	}

	@Test
	void testAddUser() {
		User user = new User(); // Create an user object with appropriate data
        try {
            boolean result = userService.addUser(user);
            assertTrue(result, "Add user should return true");
        } catch (ClassNotFoundException | SQLException e) {
            fail("Exception thrown while adding user: " + e.getMessage());
        }
    }

	
	@Test
	void testEditUser() {
	    // Arrange: Prepare test data
		User userToUpdate = new User();
		userToUpdate.setiduser(4);  // Replace with a valid user ID
		userToUpdate.setfullname("Updated Name");
		userToUpdate.setemail("updated@example.com");
		userToUpdate.setpassword("1234567890");
		userToUpdate.setusertype("jobSeeker");
		

	    // Act: Call the editAppoiment method
	    try {
	        boolean result = userService.editUser(userToUpdate);

	        // Assert: Check if the update was successful
	        assertTrue(result, "Edit user should return true");

	        // Optionally, fetch the appointment again and check if the fields match
	        User updatedUser = userService.fetchSingleUser(userToUpdate.getiduser());
	        assertNotNull(updatedUser, "Updated user should not be null");
	        assertEquals("Updated Name", updatedUser.getfullname());
	        assertEquals("updated@example.com", updatedUser.getemail());
	        assertEquals("1234567890", updatedUser.getpassword());
	        assertEquals("jobSeeker", updatedUser.getusertype());
	        
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace(); // Print the exception details for debugging
	        fail("Exception thrown while editing user: " + e.getMessage());
	    }
	}

	@Test
	void testDeleteUser() {
		 int iduser = 4; // Replace with a valid user ID
		    try {
		        boolean result = userService.deleteUser(iduser);
		        assertTrue(result, "Delete user should return true");
		    } catch (ClassNotFoundException | SQLException e) {
		        e.printStackTrace(); // Print the exception details
		        fail("Exception thrown while deleting user: " + e.getMessage());
		    }
		}

	@Test
	void testFetchSingleUser() {
			 int iduser = 1; // Replace with a valid appoiment ID
		        try {
		            User user = userService.fetchSingleUser(iduser);
		            assertNotNull(user, "Fetch single user should return a non-null object");
		        } catch (ClassNotFoundException | SQLException e) {
		            fail("Exception thrown while fetching single user: " + e.getMessage());
		        }
		    }


	@Test
	void testFetchAllUser() {
		  try {
	            List<User> users = userService.fetchAllUser();
	            assertNotNull(users, "Fetch all userss should return a non-null list");
	            assertTrue(!users.isEmpty(), "Fetched user list should not be empty");
	        } catch (ClassNotFoundException | SQLException e) {
	            fail("Exception thrown while fetching all users: " + e.getMessage());
	        }
	    }

	}
