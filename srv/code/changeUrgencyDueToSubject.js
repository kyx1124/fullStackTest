/**
 * 
 * @Before(event = { "CREATE","UPDATE" }, entity = "Processor.Incidents")
 * @param {Object} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(request) {
	const incident = request.data;
	if (incident.title?.toLowerCase().includes("urgent")) {
		  incident.urgencyT = {      
			code: "H",        
			descr: "High"        
		  };
	}
	// Your code here
}