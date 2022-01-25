/**
* Ensures coldbox is loaded.
*/
component extends="coldbox.system.testing.BaseModelTest" unloadColdBox=false appMapping="/app"{

    this.loadColdBox = true;
    this.unloadColdBox = false;

    function beforeAll(){
        super.beforeAll();

        variables.moduleService = controller.getModuleService();

        variables.moduleService.registerModule( "spotlessCF", "/testingModuleRoot" );
        variables.moduleService.activateModule( "spotlessCF", "/testingModuleRoot" );
    }

    function afterAll(){
        super.afterAll();
    }
}