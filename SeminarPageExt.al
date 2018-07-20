/* 
Change Log
----------------------------------------------------------------------------------------------------------------
DATE                |  AUTHOR                       |VERSION|   DESCRIPTION
----------------------------------------------------------------------------------------------------------------
08-AUG-2016         |ETHEL AND IVAN          |V1.0.0 |   VERSION COMPLETED
---------------------------------------------------------------------------------------------------------------
*/
//Accounting Manager role center extension
pageextension 50020 AccManRolExt extends "Accounting Manager Role Center"
{
    layout
    {
        // Add changes to page layout here
    }
actions{
    //adding the seminar group in the navigation pane
    addlast(Sections){
        group(Seminar){ //seminar group
            action("Seminar Rooms") //adding the seminar Room list action
            {
                RunObject = page "Seminar Room List";
                Image = Comment;
                ApplicationArea = All;
            }
             action("Seminar List") //adding the seminarlist action
            {
                RunObject = page "Seminar List";
                Image = ViewComments;
                ApplicationArea = All;
            }
             action("Instructor List") //adding the Instructor list action
            {
                RunObject = page "Instructor List";
                Image = ViewComments;
                ApplicationArea = All;
            }

        }


    }
}
    
    var
        myInt : Integer;
}