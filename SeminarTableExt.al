/* 
Change Log
----------------------------------------------------------------------------------------------------------------
DATE                |  AUTHOR                       |VERSION|   DESCRIPTION
----------------------------------------------------------------------------------------------------------------
08-AUG-2016         |ETHEL AND IVAN         |V1.0.0 |   VERSION COMPLETED
---------------------------------------------------------------------------------------------------------------
*/

//comment line  table extension
tableextension 50011 commentLineExt extends "Comment Line"
{
    fields
    {
        // In Extensions i was not able to add an option member in already established ooption members for table name
        // so i decided to add another field called "table name2" where i am putting all my custom option members
        //with a table extension
        field(50010;"Table Name2";Option)
        {
            //adding the seminar room option
            OptionMembers = "Seminar Room",Seminar;
        }
    }

    keys{
        
        key(PK;"Table Name2")
        {
            
        }
    }
    
    var
        myInt : Integer;
}

// extended texts table extension
tableextension 50012 extendedTextExt extends "Extended Text Header"
{
    fields
    {
        // In Extensions i was not able to add an option member in already established ooption members for table name
        // so i decided to add another field called "table name2" where i am putting all my custom option members
        //with a table extension
        field(50010;"Table Name2";Option)
        {
            //adding the seminar room option
            OptionMembers = "Seminar Room",Seminar;
        }
    }

    keys{
        key(PK;"Table Name2")
        {
            
        }
    }
    
    var
        myInt : Integer;

        
}