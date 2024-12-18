using Processor as service from '../../srv/service';
annotate service.Incidents with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Urgency',
                Value : urgencyT_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Customer',
                Value : customer_BusinessPartner,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Conversations',
            ID : 'Conversations',
            Target : 'conversations/@UI.LineItem#Conversations',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Urgency',
            Value : urgencyT_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Customer ',
            Value : customer_BusinessPartner,
        },
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
    },
);

annotate service.Incidents with {
    customer @(
        UI.MultiLineText : false,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Customers',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : customer_BusinessPartner,
                    ValueListProperty : 'BusinessPartner',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'FirstName',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'LastName',
                },
            ],
            Label : 'Customers',
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : {
            $value : customer_BusinessPartner,
            ![@UI.TextArrangement] : #TextOnly
        },
    )
};

annotate service.Incidents with {
    urgencyT @(
        Common.Text : {
            $value : urgencyT.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'UrgencyT',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : urgencyT_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'UrgencyT',
        },
        Common.ValueListWithFixedValues : true,
        )
};

annotate service.UrgencyT with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.Conversations with @(
    UI.LineItem #Conversations : [
        {
            $Type : 'UI.DataField',
            Value : author,
            Label : 'author',
        },
        {
            $Type : 'UI.DataField',
            Value : message,
            Label : 'message',
        },
        {
            $Type : 'UI.DataField',
            Value : timestamp,
            Label : 'timestamp',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Conversations',
            ID : 'Conversations',
            Target : '@UI.FieldGroup#Conversations',
        },
    ],
    UI.FieldGroup #Conversations : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : author,
                Label : 'author',
            },
            {
                $Type : 'UI.DataField',
                Value : message,
                Label : 'message',
            },
            {
                $Type : 'UI.DataField',
                Value : timestamp,
                Label : 'timestamp',
            },
            {
                $Type : 'UI.DataField',
                Value : incidents_ID,
                Label : 'incidents_ID',
            },
            {
                $Type : 'UI.DataField',
                Value : image,
                Label : 'image',
            },
        ],
    },
);

