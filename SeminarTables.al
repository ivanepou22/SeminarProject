/* 
Change Log
----------------------------------------------------------------------------------------------------------------
DATE                |  AUTHOR                       |VERSION|   DESCRIPTION
----------------------------------------------------------------------------------------------------------------
08-AUG-2016         |ETHEL AND IVAN         |V1.0.0 |   VERSION COMPLETED
---------------------------------------------------------------------------------------------------------------
*/


table 50000 "Seminar Room"
{

    fields
    {
        field(1;Code;Code[10])
        {
            //Not blank functionality makes this field mandetory
            NotBlank = true;
        }
        field(2;Name;Text[50])
        {
           
        }
        field(3;Address;Text[50])
        {

        }
        field(4;Address2;Text[50])
        {

        }
        field(5;City;Text[30])
        {
            trigger OnValidate();
            var
                myInt : Integer;
            begin
                PostCode.ValidateCity(City,"Post Code","County.","Country/Region Code",true);
            end;
        }
        field(6;"Post Code";Code[20])
        {
            //Table relation
            TableRelation = "Post Code".Code;
            //validate the table relation
            ValidateTableRelation = true;

            //Onvalidate trigger
            trigger OnValidate();
            var
                myInt : Integer;
            begin
                PostCode.ValidatePostCode(City,"Post Code","County.","Country/Region Code",true);
            end;
        }
        field(7;"Country/Region Code"; Code[10])
        {
            //Table relation
            TableRelation = "Country/Region";
            //validate the table relation
            ValidateTableRelation = true;
        }
        field(8;"Phone No.";Text[30])
        {
            //extended dataty property
            ExtendedDatatype = PhoneNo;
        }
        field(9;"Fax No.";Text[30])
        {
           //extended dataty property
            ExtendedDatatype = PhoneNo;
        }
        field(10;"Name2";Text[50])
        {
            //put other field properties here
        }
        field(11;Contact;Text[50])
        {
           
        }
        field(12;"E-mamil";Text[80])
        {
            //Makes sure a avalid email address is entered
            ExtendedDatatype = EMail;
        }
        field(13;"Home Page";Text[90])
        {
            //makes sure a valid URL is entered
             ExtendedDatatype = URL;
            
        }
        field(14;"Maximum Participants";Integer)
        {

        }
        field(15;Allocation;Decimal)
        {
            //this feield can not be editted
            Editable = false;
        }
        field(16;"Resource No.";Code[20])
        {
            //Relating this field to the resource table where type = Machine
            TableRelation = Resource WHERE (Type=CONST(Machine));
            //validating table relation
            ValidateTableRelation = true;
            
        }
      field(17;Comment;Boolean)
      {
          //flowfield functionality
          FieldClass = FlowField;
          //Specifyin the calcFormaula for the flowfield
          CalcFormula = exist("Comment Line" where (Code=field(Code)));
          //Can not be editted
          Editable = false;
      }
      field(18;"Internal/Enternal";Option)
      {
          // setting option members
          OptionMembers = Internal,External;
      } 
      field(19;"Contact No.";Code[20])
      {
           //Relating this field to contact
          TableRelation = Contact;
          //valating table relation
          ValidateTableRelation = true;
          
          // onvalidate trigger
          trigger OnValidate();
          var
              myInt : Integer;
          begin
            IF MyContact.GET("Contact No.") AND (Name = '') THEN
                Name := MyContact.Name;
          end;
      }
       field(20;"County.";Text[30])
      {

      }
    }

    keys
    {
        key(PK;Code)
        {
            Clustered = true;
        }
    }
    
    var
        myInt : Integer;
        Resource : Record Resource;
        MyContact : Record Contact;
        PostCode : Record "Post Code";
        CommentLine : Record "Comment Line";
        ExtTextHeader : Record "Extended Text Header";

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;
//*206#
    trigger OnDelete();
    begin
        //any corresponding records in the Comment Line table are
        //deleted as well.
        CommentLine.RESET;
        CommentLine.SETRANGE("Table Name2",CommentLine."Table Name2"::"Seminar Room");
        CommentLine.SETRANGE("No.",Code);
        CommentLine.DELETEALL;

        //any corresponding records in the Extended Text Header
        //table are deleted as well.
        ExtTextHeader.RESET;
        ExtTextHeader.SETRANGE("Table Name2",ExtTextHeader."Table Name2"::"Seminar Room");
        ExtTextHeader.SETRANGE("No.",Code);
        ExtTextHeader.DELETEALL(TRUE);
        
    end;

    trigger OnRename();
    begin
    end;

}

//instructor Table development
table 50001 Instructor
{

    fields
    {
        field(10;Code;Code[10])
        {
            //Mut not be blank
            NotBlank = true;
        }
        field(20;Name;Text[50])
        {
           
        }
        //option field #tfieldoption in Vscode
        field(30;"Internal/External";Option)
        {
            //setting options here
            OptionMembers = Internal,External;
            //OptionCaption = 'Internal','External';
        }
        field(40;"Resource No.";Code[20])
        {
            //Relating this field to the resource table where type = person
            TableRelation = Resource WHERE (Type=CONST(Person));
            //validating table relation
            ValidateTableRelation = true;

           //onvalidate trigger for Resource No. field
           trigger OnValidate();
           var
               myInt : Integer;
           begin
            //if the Name field in
            //the Instructor record is empty, the program fills it with the Name
            //field from the corresponding Resource record.
               IF Resource.GET("Resource No.") AND (Name = '') THEN
                Name := Resource.Name;
           end;

        }
        field(50;"Contact No.";Code[20])
        {
            //creating the table relation with contact table
            TableRelation = Contact;
            //validadte table relation
            ValidateTableRelation = true;

            //onvalidate trigger for Contact No. field
            trigger OnValidate();
                var
                    myInt : Integer;
                begin
            //if the Name field in
            //the Instructor record is empty, the program fills it with the Name
            //field from the corresponding Contact record.
                    IF MyContact.GET("Contact No.") AND (Name = '') THEN
                        Name := MyContact.Name;
            end;
        }

    }

    keys
    {
        key(PK;Code)
        {
            Clustered = true;
        }
    }
    
    var
        myInt : Integer;
        MyContact : Record Contact;
        Resource : Record Resource;

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

}

// Seminar Setup Table development
table 50002 "Seminar Setup"
{

    fields
    {
        field(10;"Primary Key";Code[10])
        {
        }
        field(20;"Seminar Nos.";Code[10])
        {
            //related to No. Series Table
            TableRelation = "No. Series";
            //valadate table relation
            ValidateTableRelation = true;
        }

        field(30;"Seminar Registration Nos.";Code[10])
        {
            //related to No. Series Table
           TableRelation = "No. Series";
            //valadate table relation
            ValidateTableRelation = true; 
        }

        field(40;"Posted Seminar Reg. Nos.";Code[10])
        {
            //related to No. Series Table
            TableRelation = "No. Series";
            //valadate table relation
            ValidateTableRelation = true;
        }
    }

    keys
    {
        key(PK;"Primary Key")
        {
            Clustered = true;
        }
    }
    
    var
        myInt : Integer;

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

}

//seminar table
table 50003 Seminar
{

    fields
    {
        field(10;"No.";Code[20])
        {
            NotBlank = True;
            trigger OnValidate();
            var
                myInt : Integer;
            begin

        /*
        When the user changes the No. value from what it is previously,
        the program gets the Seminar Setup record and uses the
        TestManual function of the NoSeriesManagement codeunit to
        test whether the number series is allowed to be manually
        changed. The program then sets the No. Series field to blank.
        */
            IF "No." <> xRec."No." THEN BEGIN
                SeminarSetup.GET;
                NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");
                "No. Series" := '';
            END;
            end;
        }

        field(20;"Name";Text[50])
        {
           
        }

        field(30;"Seminar Duration";Decimal)
        {
            DecimalPlaces = 0:1;
        }

        field(40;"Minimum Participants";Integer)
        {
            
        }
        field(50;"Maximum Participants";Integer)
        {
           
        }
        field(60;"Search Name";Code[50])
        {
            trigger OnValidate();
            var
                myInt : Integer;
            begin
        /*
        When the user enters or changes a value in the Name field, if the
        Search Name is still equal to the uppercase value of the
        previous Name or if the Search Name is blank, the program
        assigns the new Name to Search Name.
        */
        IF ("Search Name" = UPPERCASE(xRec.Name)) OR ("Search Name" = '') THEN BEGIN
            "Search Name" := Name;
        END;
                    end;
        }
        field(70;Blocked;Boolean)
        {
            
        }
        field(80;"Last Date Modified";Date)
        {
            Editable = false;
        }
        field(90;Comment;Boolean)
        {
            //flowfield functionality
            FieldClass = FlowField;
            //Specifyin the calcFormaula for the flowfield
            CalcFormula = exist("Comment Line" where (Code=field("No.")));
            //Can not be editted
            Editable = false;
        }
        field(100;"Job No.";Code[20])
        {
            TableRelation = Job;
            ValidateTableRelation = True;
            trigger OnValidate();
            var
                myInt : Integer;
                Job : Record Job;
            begin
            /*
            When the user enters or changes a value in the Job No. field, the
            program retrieves the corresponding Job record and checks that
            the Blocked field is set to <blank>.
            */
                Job.GET("Job No.");
                Job.TESTFIELD(Blocked, Job.Blocked::" ");
            end;
        }
        field(110;"Seminar Price";Decimal)
        {
            AutoFormatType = 1;
        }
        field(120;"Gen. Prod. Posting Group";Code[10])
        {
           TableRelation = "Gen. Product Posting Group";
           ValidateTableRelation = True;

           trigger OnValidate();
           var
               myInt : Integer;
               GenProdPostingGrp : Record "Gen. Product Posting Group";
           begin
                IF xRec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group" THEN BEGIN
                    IF GenProdPostingGrp.ValidateVatProdPostingGroup(GenProdPostingGrp,"Gen. Prod. Posting Group") THEN BEGIN
                        VALIDATE("VAT Prod. Posting Group",GenProdPostingGrp."Def. VAT Prod. Posting Group");
                    END;
                END;
           end;
        }
        field(130;"VAT Prod. Posting Group";Code[10])
        {
            TableRelation = "VAT Product Posting Group";
            ValidateTableRelation = True;
        }
        field(140;"No. Series";Code[10])
        {
            Editable = false;
            TableRelation = "No. Series";
            ValidateTableRelation = True;
        }
    }


    keys
    {
        key(PK;"No.","Search Name")
        {
            Clustered = true;
        }

    }
    
    var
        myInt : Integer;
        //How to declare global record variables.
        SeminarSetup : Record "Seminar Setup";
        NoSeriesMgt : Codeunit NoSeriesManagement;
        Seminar : Record Seminar;
        CommentLine : Record "Comment Line";
        ExtTextHeader : Record "Extended Text Header";
        OldSeminar : Record Seminar;


        

    trigger OnInsert();
    begin

        IF "No." = '' THEN BEGIN
        SeminarSetup.GET;
        SeminarSetup.TESTFIELD("Seminar Nos.");
        NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.",xRec."No. Series",0D,"No.","No. Series");
        END;

    end;

    trigger OnModify();
    begin
        "Last Date Modified" := TODAY;
    end;

    trigger OnDelete();
    begin
        //any corresponding records in the Comment Line table are
        //deleted as well.
        CommentLine.RESET;
        CommentLine.SETRANGE("Table Name2",CommentLine."Table Name2"::Seminar);
        CommentLine.SETRANGE(CommentLine."No.","No.");
        CommentLine.DELETEALL;

        //any corresponding records in the Extended Text Header
        //table are deleted as well.
        ExtTextHeader.RESET;
        ExtTextHeader.SETRANGE("Table Name2",ExtTextHeader."Table Name2"::Seminar);
        ExtTextHeader.SETRANGE(ExtTextHeader."No.","No.");
        ExtTextHeader.DELETEALL(TRUE);
    end;

    trigger OnRename();
    begin
        "Last Date Modified" := TODAY;
    end;
    
     procedure AssistEdit(Oldseminar : Record Seminar) : Boolean;
    
    var
        myInt : Integer;
    begin
        
     with Seminar do begin
         Seminar := Rec;
         SeminarSetup.Get;
         SeminarSetup.TestField("Seminar Nos.");
         if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos.",OldSeminar."No. Series","No. Series") THEN BEGIN 
             SeminarSetup.Get;
             SeminarSetup.TestField("Seminar Nos.");  
             NoSeriesMgt.SetSeries("No.");
             Rec := Seminar;
             exit(true);
         end;
     end;
    end;
}

//Seminar Comment Line table
table 50004 "Seminar Comment Line"
{
    LookupPageId = "Seminar Comment List page";
    DrillDownPageId = "Seminar Comment List page"; 

    fields
    {
        field(10;"Document Type";Option)
        {
            OptionMembers = "Seminar Registration","Posted Seminar Registration.";
        }
        field(20;"No.";Code[20])
        {
        }
        field(30;"Line No.";Integer)
        {
            
        }
        field(40;Date;Date)
        {
            
        }
        field(50;Code;Code[10])
        {
            
            
        }
        field(60;Comment;Text[80])
        {
            
        }
    }

    keys
    {
        key(PK;"Document Type","No.","Line No.")
        {
            Clustered = true;
        }
    }
    
    var
        myInt : Integer;

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

}
