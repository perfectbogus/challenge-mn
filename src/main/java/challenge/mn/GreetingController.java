package challenge.mn;

import io.micronaut.http.MediaType;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;

import javax.annotation.Nullable;

@Controller()
public class GreetingController {
    @Get(value = "/greeting{?name}",produces = MediaType.TEXT_PLAIN)
    public String getGreeting(@Nullable String name){
        if(name == null || name.isBlank()){
            return "Hello World";
        }else {
            return "Hello " + name;
        }
    }
}
