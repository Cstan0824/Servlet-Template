package Controllers;

import DTO.UserCredential;
import mvc.ControllerBase;
import mvc.Result;
import mvc.Annotations.HttpRequest;
import mvc.Http.HttpMethod;

public class LandingController extends ControllerBase {

    @HttpRequest(HttpMethod.GET)
    public Result index() throws Exception {
        return page();
    }

    @HttpRequest(HttpMethod.GET)
    public Result login() throws Exception {
        return page();
    }

    @HttpRequest(HttpMethod.POST)
    public Result login(String username, String password, boolean remember) throws Exception {
        // login(String username, Stirng password) -- works too

        // validate user credentials
        if (username.equals("admin") && password.equals("password")) {

            return page("index", "Landing");
        }
        return error("Invalid credentials. Please try again.");
    }
}
