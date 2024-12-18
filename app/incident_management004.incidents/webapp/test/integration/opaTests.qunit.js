sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'incidentmanagement004/incidents/test/integration/FirstJourney',
		'incidentmanagement004/incidents/test/integration/pages/IncidentsList',
		'incidentmanagement004/incidents/test/integration/pages/IncidentsObjectPage'
    ],
    function(JourneyRunner, opaJourney, IncidentsList, IncidentsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('incidentmanagement004/incidents') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheIncidentsList: IncidentsList,
					onTheIncidentsObjectPage: IncidentsObjectPage
                }
            },
            opaJourney.run
        );
    }
);