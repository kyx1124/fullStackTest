using { iac_adoptionlab as my } from '../db/schema.cds';

using { ADOPTION_LAB_API_BUSINESS_PARTNER.A_BusinessPartner } from './external/ADOPTION_LAB_API_BUSINESS_PARTNER';

@path : '/service/Processor'
service Processor
{
    @odata.draft.enabled
    entity Incidents as
        projection on my.Incidents;

    entity Customers as
        projection on A_BusinessPartner
        {
            BusinessPartner,
            FirstName,
            LastName
        };
    
    entity Conversations as
        projection on my.Conversations;

    entity UrgencyT as
        projection on my.UrgencyT;
}

annotate Processor with @requires :
[
    'authenticated-user'
];
