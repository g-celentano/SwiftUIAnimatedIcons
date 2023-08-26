# AnimatedIcons

<b>Swift Package<b> for using animated icons inside projects without the """stress""" of having to handle the state of every *animated icon*.
## Currently supported:
<details open>
<summary>Menu Icons:</summary>
    <ul>
    <li>
        <b>MoreVert-Cross Animated Icon</b><br>From vetically arranged more dots to cross icon.<br>Parameters list:
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
    - <b>MoreHor-Cross Animated Icon<b><br>From horizontally arranged more dots to cross icon.<br>Parameters list:
         - <b>isSelected</b>: state handle value
             - <b>true<b> state -> cross icon
             - <b>false<b> state -> horizontal more dots icon
         - <b>size</b>: icon size
         - <b>duration</b>: animation duration
         - <b>{dots, cross}color</b>: color for each category in-between _{}_
    - <b>Add-Cross Animated Icon<b><br>From plus icon to cross icon.<br>Parameters list:
        - <b>isSelected</b>: state handle value:
            - <b>true<b> state -> cross icon
            - <b>false<b> state -> add icon
        - <b>size</b>: icon size
        - <b>duration</b>: animation duration
        - <b>plusColor<b> : plus icon color
        - <b>crossColor<b> : cross icon color
    - <b>BurgerMenu_Cross Icon<b><br>From Burger menu icon to cross icon<br> Parameters list:
        - <b>menuState</b>: state handle value
             - <b>true<b> state -> cross icon
             - <b>false<b> state -> burger icon
        - <b>size</b>: icon size
        - <b>{burger, cross}Color</b>: color of the specified icon in-between _{}_
        - <b>duration</b>: animation duration
        - <b>isRounded</b>: rounded line-caps flag
    - <b>Chevron Rotation Icon<b> <br> Parameters list:
        - <b>isSelected</b>: state handle value
        - <b>size</b>: icon size
        - <b>duration</b>: animation duration
        - <b>from</b>: starting rotation of the chevron
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

