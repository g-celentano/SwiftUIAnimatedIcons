# AnimatedIcons

<b>Swift Package<b> for using animated icons inside projects without the """stress""" of having to handle the state of every _animated icon_.

## Currently supported:

<details open>
<summary>Menu Icons:</summary>
    <ul>
    <li>
        <summary><b>MoreVert-Cross Animated Icon</b></summary><br>From vetically arranged more dots to cross icon.<br>Parameters list:
        <ul>
             <li> <b>isSelected</b>: state handle value </li>
                <ul>
                    <li> <b>true<b> state -> cross icon </li>
                    <li> <b>false<b> state -> horizontal more dots icon </li>
                 <ul>
             <li> <b>size</b>: icon size </li>
             <li> <b>duration</b>: animation duration </li>
             <li> <b>{dots, cross}color</b>: color for each category in-between _{}_ </li>
         </ul>
     </li>
    <li> <summary><b>MoreHor-Cross Animated Icon<b></summary><br>From horizontally arranged more dots to cross icon.<br>Parameters list:
        <ul>
             <li> <b>isSelected</b>: state handle value
             <ul>
                 <li> <b>true<b> state -> cross icon</li>
                 <li> <b>false<b> state -> horizontal more dots icon</li>
             </ul>
             </li>
             <li> <b>size</b>: icon size </li>
             <li> <b>duration</b>: animation duration </li>
             <li> <b>{dots, cross}color</b>: color for each category in-between _{}_ </li>
         <ul>
    </li>
    <li><summary><b>Add-Cross Animated Icon<b></summary><br>From plus icon to cross icon.<br>Parameters list:
        <ul>
        <li> <b>isSelected</b>: state handle value:
            <ul>
            <li> <b>true<b> state -> cross icon</li>
            <li> <b>false<b> state -> add icon</li>
            </ul>
        </li>
        <li> <b>size</b>: icon size </li>
        <li> <b>duration</b>: animation duration</li>
        <li> <b>plusColor<b> : plus icon color</li>
        <li> <b>crossColor<b> : cross icon color</li>
        </ul>
    </li>
    <li> <summary><b>BurgerMenu_Cross Icon<b></summary><br>From Burger menu icon to cross icon<br> Parameters list:
    <ul>
        <li> <b>menuState</b>: state handle value
        <ul>
             <li> <b>true<b> state -> cross icon</li>
             <li> <b>false<b> state -> burger icon</li>
        </ul>
        </li>
        <li> <b>size</b>: icon size</li>
        <li> <b>{burger, cross}Color</b>: color of the specified icon in-between _{}_ </li>
        <li> <b>duration</b>: animation duration</li>
        <li> <b>isRounded</b>: rounded line-caps flag</li>
        <ul>
    </li>
    <li> <summary><b>Chevron Rotation Icon<b> </summary><br> Parameters list:
    <ul>
        <li> <b>isSelected</b>: state handle value</li>
        <li> <b>size</b>: icon size</li>
        <li> <b>duration</b>: animation duration</li>
        <li> <b>from</b>: starting rotation of the chevron</li>
    </ul>
    </li>
    <ul>
</details>
- Light/Dark mode icons:
    -  <b>Sun-Moon icon<b> <br> Parameters list:
         - <b>isSun</b>: state handle value
         - <b>size</b>: icon size
         - <b>duration</b>: animation duration
         - <b>{sun, moon}Color</b>: color of the indicated icon
- Loading icons:
    -  <b>LoadingSpinner animation:<b><br>Parameters list:
         - <b>loadingAmount</b>: spinner "drawed" amount (from 0 to 360)
         - <b>size</b>: icon size
         - <b>color</b>: icon color
         - <b>isRounded</b>: are lineCaps rounded?
         - <b>rotationSpeed</b>: multiplicative constant for animation speed management
