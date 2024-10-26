### Functions
<ul>
    <li> NewCecho</li>
    <li> AdvCecho</li>
    <li> AdvCecho_Bold</li>
    <li> AdvCecho_Underline</li>
    <li> AdvCecho_Background</li>
    <li> AdvCecho_HighIntensity</li>
    <li> AdvCecho_HighIntensityBackground</li>
</ul>
### TODO
<hr>

#### Convert each item to a passable cmdline parameter.

&emsp; Example: &nbsp; Instead of using:
<br>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; ``` cecho ${Red} This text is Red. ${Color_Off} ``` ,
<br> &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp; we should be able to use:
<br>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp; ``` cecho --red "This Text is Red." ```
<br>
<br>
    &emsp; Currenty we can use NewCecho and AdvCecho to do this.
