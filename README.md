# AnimatedIcons

**Swift Package** for using animated icons inside projects without the """stress""" of having to handle the state of every *animated icon*.
## Currently supported:
<details open>
<summary> - Menu Icons:</summary>
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
    - **Chevron Rotation Icon** <br> Parameters list:
        - **isSelected**: state handle value
        - **size**: icon size
        - **duration**: animation duration
        - **from**: starting rotation of the chevron
</details>
- Light/Dark mode icons:
    -  **Sun-Moon icon** <br> Parameters list:
         - **isSun**: state handle value
         - **size**: icon size
         - **duration**: animation duration
         - **{sun, moon}Color**: color of the indicated icon
- Loading icons:
    -  **LoadingSpinner animation:**<br>Parameters list:
         - **loadingAmount**: spinner "drawed" amount (from 0 to 360)
         - **size**: icon size
         - **color**: icon color
         - **isRounded**: are lineCaps rounded?
         - **rotationSpeed**: multiplicative constant for animation speed management

