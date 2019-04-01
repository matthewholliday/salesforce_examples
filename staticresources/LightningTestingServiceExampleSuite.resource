describe('Testing c:MyComponent',function(){
    describe('c:LightningTestingServiceComponentUT', function () {
        it("Verify Rendering & Data-Binding", function(done) {
            $T.createComponent('c:LightningTestingServiceComponentUT',{myAttribute : "xyz"},true)
                .then(function(component) {

                    //Test the DOM:
                    expect(document.getElementById("myAttributeId").textContent).toContain("xyz");

                    //Test a method:
                    //Method must be part of API exposed in component markup.
                    expect(component.myTestMethod()).toBe('123');

                    //Mock server-side calls:
                    var mockResponse = {
                        getState : function() { return "SUCCESS"},
                        getReturnValue : function (){return 'abc';}
                    }

                    spyOn($A, "enqueueAction").and.callFake(function (action) {
                        var cb = action.getCallback("SUCCESS");
                        cb.fn.apply(cb.s, [mockResponse]);
                    });

                    component.myTestServerMethod();
                    expect(document.getElementById("myServerAttributeId").textContent).toContain("abc");

                    //Complete test.
                    done();
                }).catch(function (e) {
                done.fail(e);
            });
        });
    });
})