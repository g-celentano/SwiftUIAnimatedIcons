# AnimatedIcons

**Swift Package** for using animated icons inside projects without the """stress""" of having to handle the state of every *animated icon*.
## Currently supported:
 - **MoreVert-Cross Animated Icon**<br>From vetically arranged more dots to cross icon.<br>Parameters list:
     - **isSelected**: state handle value
         - **true** state -> cross icon
         - **false** state -> horizontal more dots icon
     - **size**: icon size
     - **duration**: animation duration
     - **{dots, cross}color**: color for each category in-between _{}_
 - **MoreHor-Cross Animated Icon**<br>From horizontally arranged more dots to cross icon.<br>Parameters list:
     - **isSelected**: state handle value
         - **true** state -> cross icon
         - **false** state -> horizontal more dots icon
     - **size**: icon size
     - **duration**: animation duration
     - **{dots, cross}color**: color for each category in-between _{}_
 - **Add-Cross Animated Icon**<br>From plus icon to cross icon.<br>Parameters list:
    - **isSelected**: state handle value:
        - **true** state -> cross icon
        - **false** state -> add icon
    - **size**: icon size
    - **duration**: animation duration
    - **plusColor** : plus icon color
    - **crossColor** : cross icon color
 - **BurgerMenu_Cross Icon**<br>From Burger menu icon to cross icon<br> Parameters list:
    - **menuState**: state handle value
         - **true** state -> cross icon
         - **false** state -> burger icon
    - **size**: icon size
    - **{burger, cross}Color**: color of the specified icon in-between _{}_
    - **duration**: animation duration
    - **isRounded**: rounded line-caps flag
