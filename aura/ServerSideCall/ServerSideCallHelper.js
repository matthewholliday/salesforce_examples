({
    serverSideCallHelper : function(component){
        var action = component.get("c.getData");
        action.setParams({myParam : "Test data."});
        action.setCallback(this,
                           function(response){
                                serverSideCallHelperCallback(response);
                           });
        $A.enqueueAction(action);
    },

    serverSideCallHelperCallback : function(response){
        var stat = response.getState();
        if(state === "SUCCESS"){
            console.log(response.getReturnValue());
        } else if (state === "INCOMPLETE"){
            console.log('Response incomplete.');
        } else if (state === "ERROR"){
            var errors = response.getError();
            if(errors){
                if(errors[0] && errors[0].message){
                    console.log("Error message: " + errors[0].message);
                } else {
                    console.log("Unknown error");
                }
            }

        }
    }
})