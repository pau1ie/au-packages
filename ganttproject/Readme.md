# GanttProject

This is all rather unsatisfactory. 

GanttProject requires Java to run. There are several different providers of java,
including Oracle JDK, OpenJDK and AdoptOpenJDK.

Chocolatey doesn't yet allow applications to create a "provides" tag. This would be ideal,
because then the user could decide which java to use. 

The Oracle JDK would be the default option, but it seems Oracle are changing the license on their JDK. OpenJDK
would seem like a better option, but that doesn't set up the registry keys so the stub executable 
which comes with GanttProject recognises that Java is installed. AdoptOpenJDK can do so, but it is an
install option.

Thus I have set up this package to use OpenJDK, because it is the most popular. Thus I need to avoid calling
the stub executable, and so I use the batch file instead. I update the default application with assoc and ftype.
The batch file is also updated with the install directory and the plugins.