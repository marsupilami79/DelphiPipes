{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

Author:       François PIETTE @ OverByte
Creation:     Apr 04, 2013
Description:  Registration unit for Pipe components by Russell Libby
Version:      1.00
History:


 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
unit PipesReg;

interface

uses
   Windows, Classes, Pipes;

////////////////////////////////////////////////////////////////////////////////
// Registration function
////////////////////////////////////////////////////////////////////////////////
procedure Register;

implementation

procedure Register;
begin
    // Register the components under the Pipes tab
    RegisterComponents('Russell Libby', [TPipeServer, TPipeClient, TPipeConsole]);
end;

end.
