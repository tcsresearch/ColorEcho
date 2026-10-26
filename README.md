<img src="https://github.com/tcsresearch/ColorEcho/blob/main/ColorEcho-Logo.png">

# ColorEcho
<ul>
 Library and Tools For Colorized BASH Output
</ul>
 <hr>

> [!NOTE]
> ColorEcho will allow for colorized output in BASH scripts.
<hr>

> [!WARNING]
> This code is highly experiemental and has NOT been fully implemented or tested.
> <hr>

> [!IMPORTANT]
> Code is NOT suitable for production, and still lacks most features.
<hr>

<p>
 Update 10/26/2026: 
 <ul>
  <li> Added ColorTerm-Setup.sh, ColorTerm-Setup-2.sh, ColorTerm-Setup.bfunc, and Cecho-Wrapper.sh.   [TESTING] </li>
  <li> Renamed SuperEcho-v2.sh as LogEcho.sh and created LogEcho-v2.sh. [TESTING] </li>
 </ul>
 </p>

<p>
Update 10/24/2026: 
 <ul>
   <li> Added SuperEcho.sh and SuperEecho-v2.sh. [TESTING]. </li>
 </ul>
 </p>

<p>
Update 01/30/2026: 
 <ul>
  <li> Minor improvements to Cecho.bfunc, incl. new colors. [WORKING]. </li>
  <li> Retired NewCecho; Renamed AdvCecho as Cecho. </li>
 </ul>
</p>

<p>
Update 10/23/2025: 
 <ul>
  <li> Major improvements to SanityChecker_Cecho.bfunc [UNTESTED]. </li>
  <li> Formatting and typo fixes for files in the 'functions' folder. </li>
 </ul>
</p>

<p>
Update 02/27/2025: 
 <ul>
   <li> An updated AdvCecho.bfunc with several additional supported colors. </li>
   <li> This may soon become the default Cecho function but remains in testing for now. </li>
 </ul>
</p>

<p>
Update 11/22/2024: 
 <ul>
  <li> An updated NewCecho.bfunc has been added which greatly improves on the Usage() function. </li>
 </ul>
</p>

<p>
Update 06/15/2024: 
 <ul>
   <li> A NewCecho.bfunc has been added which will supercede our original code. </li>
 <ul><i>
 It is far simpler and appears to work, but requires further testing and some new features. The main drawback is loss of ability to use multiple colors on the same line. 
 </i></ul>
</p>
  
<p>
 
There may be a best of both worlds option.  <br>
<ul><i>
 If we have NewCecho.bfunc become our new core code and the original code become AdvancedCecho.bfunc or AdvCecho.bfunc, we could call the ability to use multiple colors on the same line when needed and everything else will use the NewCecho code for simplicity.
</i></ul>
</p><p>
 
Another feature in the original code is more colors, flashing colors, etc.
</p>
