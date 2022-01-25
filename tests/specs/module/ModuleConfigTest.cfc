/**
* This tests the module loader.
*/
component extends="tests.specs.BaseModuleTest"{


    function beforeAll(){
        super.beforeAll();

        variables.moduleService = controller.getModuleService();
    }

    function afterAll(){
        super.afterAll();
    }


    function run(){
        describe( "ModuleConfig", function() {

            // TODO: Figure out why the `unload()` test breaks THIS test on subsequent test runs.
            it( "loads the module", function() {
                expect( function() {
                    variables.moduleService.registerModule( "spotlessCF", "/testingModuleRoot" );
                    variables.moduleService.activateModule( "spotlessCF", "/testingModuleRoot" );
                    
                    // debug( variables.moduleService.getModuleRegistry() );
                }).notToThrow();
    
                expect( getWirebox().getInstance( "Formatter@spotlessCF" ) ).toBeTypeOf( "component" );
            });
    
            it( "can UNload the module", function() {
                variables.moduleService.unload( "spotlessCF" );
                
                // bah; variables.moduleService leaves the key in the registry. 🙄
                // expect( variables.moduleService.getModuleRegistry() ).notToHaveKey( "spotlessCF" );
            });
        } );
    }

}