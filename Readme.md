<!-- default file list -->
*Files to look at*:

* **[Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))**
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx](./VB/Default.aspx))
<!-- default file list end -->
# ASPxGridView - How to hide the control when it does not display records


<strong>Problem:</strong><br />Sometimes my ASPxGridView control does not display records because of an empty datasource or specific filter condition. How can I hide the control in this scenario?<br /><br /><strong>Solution:</strong><br />The most common solution that should cover all the scenarios I imagine, is to handle the client-side Init and EndCallback events and disable the control visibility using the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebScriptsASPxClientControl_SetVisibletopic">ASPxClientControl.SetVisible</a> method if the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebScriptsASPxClientGridView_GetVisibleRowsOnPagetopic">ASPxClientGridView.GetVisibleRowsOnPage</a> method return a value greater than zero. See the source code of this example for more details.

<br/>


