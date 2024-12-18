namespace iac_adoptionlab;

using { ADOPTION_LAB_API_BUSINESS_PARTNER } from '../srv/external/ADOPTION_LAB_API_BUSINESS_PARTNER.cds';

using { sap.common.CodeList } from '@sap/cds/common';

entity Incidents
{
    key ID : UUID
        @Core.Computed;
    title : String(100)
        @title : '';
    conversations : Composition of many Conversations on conversations.incidents = $self;
    urgencyT : Association to one UrgencyT;
    customer : Association to one ADOPTION_LAB_API_BUSINESS_PARTNER.A_BusinessPartner;
}

entity Conversations
{
    key ID : UUID;
    timestamp : DateTime
        @cds.on.insert : $now;
    author : String(100)
        @cds.on.insert : $user;
    message : String(100);
    incidents : Association to one Incidents;
    image : LargeString
        @Core.MediaType : 'application/pdf';
}

entity UrgencyT : CodeList
{
    key code : Urgency;
}

type Urgency : String enum
{
    High = 'H';
    Medium = 'M';
    Low = 'L';
}
