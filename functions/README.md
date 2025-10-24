### Functions
<hr>
<ul>
    --- Implementations ---
    <li> NewCecho - Current Cecho Implementation. </li>
    <li> AdvCecho - NewCecho with white color added and grey as an alias of gray. </li>
    <li> AdvCecho_Bold - AdvCecho Bold. </li>
    <li> AdvCecho_Underline - AdvCecho Underline. </li>
    <li> AdvCecho_Background - AdvCecho Background. </li>
    <li> AdvCecho_HighIntensity - High Intensity AdvCecho. </li>
    <li> AdvCecho_HighIntensityBackground - High Intensity Background AdvCecho. </li>
    <br>
    --- Tools ---
    <li> SanityChecker_Cecho.bfunc - Functions to enable/disable Cecho.</li>
</ul>

### TODO
<hr>

<ul>

<li> Rename NewCecho as Cecho. </li>
<li> Rename AdvCecho_Functions as Cecho_Functions. </li>
<li> [READY TO TEST] Create an easy way to source via functions.list. </li>
<li> [PRIORITY] Test SanityChecker_Cecho.bfunc </li>
<li> Convert each item to a passable cmdline parameter. </li>

&emsp; Example: &nbsp; Instead of using:
<br>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; ``` cecho ${Red} This text is Red. ${Color_Off} ``` ,
<br> &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp; we should be able to use:
<br>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp; ``` cecho --red "This Text is Red." ```
<br>
<br>
    &emsp; Currenty we can use NewCecho and AdvCecho to do this.
</li>
