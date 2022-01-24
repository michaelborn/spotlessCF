/**
* Copyright Since 2005 Ortus Solutions, Corp
* www.ortussolutions.com
**************************************************************************************
*/
component{
	this.name = "A TestBox Runner Suite";
	// any other application.cfc stuff goes below:
	this.sessionManagement = true;

	// Pull in spotless-lib.jar dependency
	this.javaSettings = {
		reloadOnChange : true,
		loadPaths : [
			expandPath( "../lib/spotless-lib-2.22.0" )
		]
	};

	// any mappings go here, we create one that points to the root called test.
	testsPath = getDirectoryFromPath( getCurrentTemplatePath() );
	rootPath = replace( testsPath, '/tests', '' );

	this.mappings[ "/root" ] = rootPath;
	this.mappings[ "/tests" ] = testsPath;
	this.mappings[ "/spotlessCF" ] = rootPath;
	this.mappings[ "/models" ] = rootPath & "models";

	// funky path for coldbox moduleService invocation
    this.mappings[ "/testingModuleRoot" ] = listDeleteAt( rootPath, listLen( rootPath, '\/' ), "\/" );
    this.mappings[ "/app" ] = testsPath & "resources/app";
    this.mappings[ "/coldbox" ] = testsPath & "coldbox";
    this.mappings[ "/testbox" ] = rootPath & "testbox";

	// request start
	public boolean function onRequestStart( String targetPage ){
		if ( url.keyExists( "fwreinit" ) ){
			applicationStop();
		}
		return true;
	}
}