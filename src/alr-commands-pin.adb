with Alr.Platform;
with Alr.Query;
with Alr.Templates;

package body Alr.Commands.Pin is

   -------------
   -- Execute --
   -------------

   overriding procedure Execute (Cmd : in out Command)
   is
      pragma Unreferenced (Cmd);
      Guard : constant Folder_Guard := Enter_Project_Folder with Unreferenced;
   begin
      Requires_Project;

      declare
         Success    :          Boolean;
         Deps       : constant Query.Instance :=
                        Query.Resolve (Root.Current.Dependencies.Evaluate (Platform.Properties),
                                       Success,
                                       Query_Policy);
      begin
         if Success then
            Templates.Generate_Prj_Alr (Deps,
                                        Root.Current,
                                        Templates.Pinning);
         else
            Trace.Error ("Could not resolve dependencies");
            raise Command_Failed;
         end if;
      end;
   end Execute;

end Alr.Commands.Pin;
