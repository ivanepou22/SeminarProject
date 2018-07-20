/* 
Change Log
----------------------------------------------------------------------------------------------------------------
DATE                |  AUTHOR                       |VERSION|   DESCRIPTION
----------------------------------------------------------------------------------------------------------------
08-AUG-2016         |ETHEL AND IVAN         |V1.0.0 |   VERSION COMPLETED
---------------------------------------------------------------------------------------------------------------
*/

//Seminar Room Card Page
page 50000 "Seminar Room Card"
{
    // The page will be of type "Card" and it will be displayed in the characteristic manner.
    PageType = Card;

     // The source table shows data from the "Reward" table.
    SourceTable = "Seminar Room";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Code;Code)
                {
                    // ApplicationArea sets the application area that
                    // applies to the page field and action controls.
                    // Setting the property to All means that the control
                    // will always appear in the user interface.
                 ApplicationArea = All;   
                }
                field(Name;Name)
                {
                    // ApplicationArea sets the application area that
                    // applies to the page field and action controls.
                    // Setting the property to All means that the control
                    // will always appear in the user interface.
                 ApplicationArea = All;   
                }
                field(Name2;Name2)
                {
                    // ApplicationArea sets the application area that
                    // applies to the page field and action controls.
                    // Setting the property to All means that the control
                    // will always appear in the user interface.
                 ApplicationArea = All;   
                }
                field(Address;Address)
                {
                    // ApplicationArea sets the application area that
                    // applies to the page field and action controls.
                    // Setting the property to All means that the control
                    // will always appear in the user interface.
                 ApplicationArea = All;   
                }
                field(Address2;Address2)
                {
                    // ApplicationArea sets the application area that
                    // applies to the page field and action controls.
                    // Setting the property to All means that the control
                    // will always appear in the user interface.
                  ApplicationArea = All;  
                }
                field(City;City)
                {
                    // ApplicationArea sets the application area that
                    // applies to the page field and action controls.
                    // Setting the property to All means that the control
                    // will always appear in the user interface.
                 ApplicationArea = All;  
                }
                field("Post Code";"Post Code")
                {
                    // ApplicationArea sets the application area that
                    // applies to the page field and action controls.
                    // Setting the property to All means that the control
                    // will always appear in the user interface.
                  ApplicationArea = All;  
                }
                field("Country/Region Code";"Country/Region Code")
                {
                    // ApplicationArea sets the application area that
                    // applies to the page field and action controls.
                    // Setting the property to All means that the control
                    // will always appear in the user interface.
                  ApplicationArea = All;  
                }
                field("Fax No.";"Fax No.")
                {
                    // ApplicationArea sets the application area that
                    // applies to the page field and action controls.
                    // Setting the property to All means that the control
                    // will always appear in the user interface.
                 ApplicationArea = All;   
                }
                field("Maximum Participants";"Maximum Participants")
                {
                    // ApplicationArea sets the application area that
                    // applies to the page field and action controls.
                    // Setting the property to All means that the control
                    // will always appear in the user interface.
                 ApplicationArea = All;   
                }
                field(Allocation;Allocation)
                {
                    // ApplicationArea sets the application area that
                    // applies to the page field and action controls.
                    // Setting the property to All means that the control
                    // will always appear in the user interface.
                 ApplicationArea = All;   
                }
                field("Resource No.";"Resource No.")
                {
                    // ApplicationArea sets the application area that
                    // applies to the page field and action controls.
                    // Setting the property to All means that the control
                    // will always appear in the user interface.
                  ApplicationArea = All;  
                }
                field(Comment;Comment)
                {
                    // ApplicationArea sets the application area that
                    // applies to the page field and action controls.
                    // Setting the property to All means that the control
                    // will always appear in the user interface.
                  ApplicationArea = All;  
                }
                field("Internal/Enternal";"Internal/Enternal")
                {
                    // ApplicationArea sets the application area that
                    // applies to the page field and action controls.
                    // Setting the property to All means that the control
                    // will always appear in the user interface.
                   ApplicationArea = All; 
                }
                
            }
            group(Communication)
            {
                field(Contact;Contact)
                {
                    // ApplicationArea sets the application area that
                    // applies to the page field and action controls.
                    // Setting the property to All means that the control
                    // will always appear in the user interface.
                  ApplicationArea = All;  
                }
                field(Email;"E-mamil")
                {
                // ApplicationArea sets the application area that
                // applies to the page field and action controls.
                // Setting the property to All means that the control
                // will always appear in the user interface.
                  ApplicationArea = All; 
                    
                //set the "Importance" property to "Promoted", so that
                //when the Communication FastTab is minimized, the phone number
                //and email address of the seminar room will always be visible.
                    Importance = Promoted;
                }
                field("Phone No.";"Phone No.")
                {
                //set the "Importance" property to "Promoted", so that
                //when the Communication FastTab is minimized, the phone number
                //and email address of the seminar room will always be visible.
                    Importance = Promoted;
                // ApplicationArea sets the application area that
                // applies to the page field and action controls.
                // Setting the property to All means that the control
                // will always appear in the user interface.
                  ApplicationArea = All; 
                }
                field("Home Page";"Home Page")
                {
                // ApplicationArea sets the application area that
                // applies to the page field and action controls.
                // Setting the property to All means that the control
                // will always appear in the user interface.
                    ApplicationArea = All;
                }
                field("Contact No.";"Contact No.")
                {
                // ApplicationArea sets the application area that
                // applies to the page field and action controls.
                // Setting the property to All means that the control
                // will always appear in the user interface.
                    ApplicationArea = All;
                }
            }
        }
        //adding the factboxes in the card page 
            area(FactBoxes)
            {
                part(MyPart; "Acc. Sched. KPI Web Srv. Lines")  { }

                //adding the factbox for links on the card page
                systempart(Links; Links)  { } 
                
                //adding the factbox for notes on the card page
                systempart(Notes; Notes)  { }         
            }
    }

    actions
    {
        area(Navigation)
        {
            group("Seminar Room")
            {
                action("Co&mments")
            {
              ApplicationArea = ALL;
              RunObject = page "Comment Sheet";
              Image = ViewComments;
              RunPageLink = "Table Name2" = const("Seminar Room");
            }
            action("E&xtended Texts")
            {
                RunObject = page "Extended Text";
                Image = ViewComments;
                ApplicationArea = All;
                RunPageLink = "Table Name2" = const("Seminar Room");
            }
            }
        }
    }
    
    var
        myInt : Integer;
}
page 50010 "Seminar Room List"
{
   // Specify that this page will be a list page. 
    PageType = List;
     // The data of this page is taken from the "Reward" table.
    SourceTable = "Seminar Room";

    // The "CardPageId" is set to the Reward Card previously created.
    // This will allow users to open records from the list in the "Reward Card" page.
    CardPageId = "Seminar Room Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(code;Code)
                {
                // ApplicationArea sets the application area that
                // applies to the page field and action controls.
                // Setting the property to All means that the control
                // will always appear in the user interface.
                    ApplicationArea = All;    
                }
                 field(Name;Name)
                {
                // ApplicationArea sets the application area that
                // applies to the page field and action controls.
                // Setting the property to All means that the control
                // will always appear in the user interface.
                    ApplicationArea = All;    
                }
                 field("Maximum Participants";"Maximum Participants")
                {
                // ApplicationArea sets the application area that
                // applies to the page field and action controls.
                // Setting the property to All means that the control
                // will always appear in the user interface.
                    ApplicationArea = All;    
                }
                 field("Resource No.";"Resource No.")
                {
                // ApplicationArea sets the application area that
                // applies to the page field and action controls.
                // Setting the property to All means that the control
                // will always appear in the user interface.
                    ApplicationArea = All;    
                }
                
            }
        }
        area(factboxes)
        {
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Seminar Room"){
                    action("Co&mments")
            {
              ApplicationArea = ALL;
              RunObject = page "Comment Sheet";
              Image = ViewComments;
              RunPageLink = "Table Name2" = const("Seminar Room");
            }
            action("E&xtended Texts")
            {
                RunObject = page "Extended Text";
                Image = ViewComments;
                ApplicationArea = All;
                RunPageLink = "Table Name2" = const("Seminar Room");
            }

                
            }
        }
    }
}
////Instructor Card Page

page 50017 "Instructor Card"
{
    PageType = Card;
    SourceTable = Instructor;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Code;Code)
                {
                    
                }
                field(Name;Name)
                {
                    
                }
                field("Internal/External";"Internal/External")
                {
                    
                }
                field("Resource No.";"Resource No.")
                {
                    
                }
                field("Contact No.";"Contact No.")
                {
                    
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
    
    var
        myInt : Integer;
}


//Instructor List Page////////////////////////////////////
page 50011 "Instructor List"
{
    PageType = List;
    SourceTable = Instructor;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code;Code)
                {
                    ApplicationArea = All;  
                }
                field(Name;Name)
                {
                 ApplicationArea = All;     
                }
                field("Internal/External";"Internal/External")
                {
                    ApplicationArea = All;  
                }
                field("Resource No.";"Resource No.")
                {
                   ApplicationArea = All;   
                }
                field("Contact No.";"Contact No.")
                {
                   ApplicationArea = All;  
                }
            }
        }
        area(factboxes)
        {
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
}

//Semnar setup card page
page 50012 "Seminar Setup Card"
{
    PageType = Card;
    SourceTable = "Seminar Setup";

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                field("Seminar Nos.";"Seminar Nos.")
                {
                    ApplicationArea = All;  
                }
                field("Seminar Registration Nos.";"Seminar Registration Nos.")
                {
                    ApplicationArea = All;  
                }
                field("Posted Seminar Reg. Nos.";"Posted Seminar Reg. Nos.")
                {
                   ApplicationArea = All;   
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
    
    var
        myInt : Integer;

        trigger OnOpenPage();
        var
            myInt : Integer;
        begin
        //the program resets the record, and
        //if it does not get a record, it inserts a new one.
            RESET;
            IF NOT GET THEN
            INSERT;
        end;
}

//Seminar card page
 page 50013 "Seminar Card"
 {
     PageType = Card;
     SourceTable = Seminar;
 
     layout
     {
         area(content)
         {
             group(General)
             {
                 field("No.";"No.")
                 {
                   ApplicationArea = All; 
                   AssistEdit = true;

                   trigger OnAssistEdit();
                   var
                       myInt : Integer;
                       seminarcard :Page "Seminar Card";
                   begin
                       //using the AssistEdit function and passing the previous record as an argument
                       IF AssistEdit(xRec) THEN
                        CurrPage.UPDATE;
                    
                   end;   
                 }
                 field(Name;Name)
                 {
                    ApplicationArea = All;   
                 }
                 field("Search Name";"Search Name")
                 {
                   ApplicationArea = All;    
                 }
                 field("Seminar Duration";"Seminar Duration")
                 {
                     ApplicationArea = All;  
                 }
                 field("Minimum Participants";"Minimum Participants")
                 {
                     ApplicationArea = All;  
                 }
                 field("Maximum Participants";"Maximum Participants")
                 {
                     ApplicationArea = All;  
                 }
                 field(Blocked;Blocked)
                 {
                     ApplicationArea = All;  
                 }
                 field("Last Date Modified";"Last Date Modified")
                 {
                     ApplicationArea = All;  
                 }
             }

             group(Invoicing)
             {
                 field("Seminar Price";"Seminar Price")
                 {
                   ApplicationArea = All;    
                 }
                 field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                 {
                   ApplicationArea = All;    
                 }
                 field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
                 {
                    ApplicationArea = All;   
                 }
                 field("Job No.";"Job No.")
                 {
                   ApplicationArea = All;    
                 }
                 
                 
             }
         }

         area(FactBoxes)
            {
                part(MyPart; "Customer Picture")  { }

                //adding the factbox for links on the card page
                systempart(Links; Links)  { } 
                
                //adding the factbox for notes on the card page
                systempart(Notes; Notes)  { }         
            }
     }
 
     actions
     {
          area(Navigation)
        {
            group("&Seminar Room"){
                    action("Co&mments")
            {
              ApplicationArea = ALL;
              RunObject = page "Comment Sheet";
              Image = ViewComments;
              RunPageLink = "Table Name2" = const("Seminar");
            }
            action("E&xtended Texts")
            {
                RunObject = page "Extended Text";
                Image = ViewComments;
                ApplicationArea = All;
                RunPageLink = "Table Name2" = const("Seminar");
            }
            action("Seminar Setup")
            {
                RunObject = page "Seminar Setup Card";
                Image = Setup;
                ApplicationArea = All;
            }

                
            }
        }
     }
     
     var
         myInt : Integer;
 }

 //seminar list page
 page 50014 "Seminar List"
 {
     PageType = List;
     SourceTable = Seminar;
     CardPageId = "Seminar Card";
     Editable = false;
 
     layout
     {
         area(content)
         {
             repeater(Group)
             {
                 field("No.";"No.")
                 {
                     ApplicationArea = ALL;
                 }
                 field(Name;Name)
                 {
                    ApplicationArea = ALL; 
                 }
                 field("Seminar Duration";"Seminar Duration")
                 {
                   ApplicationArea = ALL;  
                 }
                 field("Minimum Participants";"Minimum Participants")
                 {
                    ApplicationArea = ALL; 
                    Visible =false;
                 }
                 field("Maximum Participants";"Maximum Participants")
                 {
                    ApplicationArea = ALL; 
                    Visible = false;
                 }
                 field("Search Name";"Search Name")
                 {
                     ApplicationArea = ALL;
                     Visible = false;

                 }
                 field(Blocked;Blocked)
                 {
                     ApplicationArea = ALL;
                     Visible = false;
                 }
                 field("Last Date Modified";"Last Date Modified")
                 {
                     ApplicationArea = ALL;
                 }
                 field(Comment;Comment)
                 {
                     ApplicationArea = ALL;
                     Visible = false;
                 }
                 field("Seminar Price";"Seminar Price")
                 {
                     ApplicationArea = ALL;
                 }

                 field("Job No.";"Job No.")
                 {
                     ApplicationArea = ALL;
                 }

                 field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                 {
                     ApplicationArea = ALL;
                 }
                 field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
                 {
                     ApplicationArea = ALL;
                 }

             }
         }
         area(factboxes)
         {
             part(MyPart; "Acc. Sched. KPI Web Srv. Lines")  { }

                //adding the factbox for links on the card page
                systempart(Links; Links)  { } 
                
                //adding the factbox for notes on the card page
                systempart(Notes; Notes)  { } 
         }
     }
 
     actions
     {
          area(Navigation)
        {
            group("&Seminar Room"){
                    action("Co&mments")
            {
              ApplicationArea = ALL;
              RunObject = page "Comment Sheet";
              Image = ViewComments;
              RunPageLink = "Table Name2" = const("Seminar");
            }
            action("E&xtended Texts")
            {
                RunObject = page "Extended Text";
                Image = ViewComments;
                ApplicationArea = All;
                RunPageLink = "Table Name2" = const("Seminar");
            }
            action("Seminar Setup")
            {
                RunObject = page "Seminar Setup Card";
                Image = Setup;
                ApplicationArea = All;
            }

                
            }
        }
     }
 }

 //Seminar Comment List page
 page 50015 "Seminar Comment List page"
 {
     PageType = List;
     SourceTable = "Seminar Comment Line";
 
     layout
     {
         area(content)
         {
             repeater(Group)
             {
                 field("No.";"No.")
                 {
                     
                 }
                field(Date;Date)
                 {
                     
                 }
                 field(Comment;Comment)
                 {
                     
                 }
                 field(Code;Code)
                 {
                    Visible = false;      
                     
                 }
                 
             }
         }
         area(factboxes)
         {
         }
     }
 
     actions
     {
         area(processing)
         {
             action(ActionName)
             {
                 trigger OnAction();
                 begin
                 end;
             }
         }
     }
 }
//
 //Seminar Comment Sheet form
 page 50016 "Seminar Comment Sheet form"
 {
     PageType = List;
     SourceTable = "Seminar Comment Line";
 
     layout
     {
         area(content)
         {
             repeater(Group)
             {
                 field(Date;Date)
                 {
                     
                 }
                 field(Comment;Comment)
                 {
                     
                 }
                 field(Code;Code)
                 {
                     Visible = false;
                 }
             }
         }
         area(factboxes)
         {
         }
     }
 
     actions
     {
         area(processing)
         {
             action(ActionName)
             {
                 trigger OnAction();
                 begin
                 end;
             }
         }
     }
 }