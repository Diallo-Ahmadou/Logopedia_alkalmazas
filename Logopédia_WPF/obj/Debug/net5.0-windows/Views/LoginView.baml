   M S B A M L   `   `   `  ����I  ELogopédia_WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Logopédia_WPF.ViewsLogopédia_WPF.Views  5   	   E'clr-namespace:Logopédia_WPF.ViewModelsLogopédia_WPF.ViewModels  5   	   $    Logopédia_WPF.Views.LoginView   5   	   W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:Logopédia_WPF.Views     5   	   6vm'clr-namespace:Logopédia_WPF.ViewModels     5   	   _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	     � Title$   ��5
   	   $��30(�6   ���#10bbe6 � WindowStyle$
 None=�5       � 
ResizeMode$ NoResize=�6    � WindowStartupLocation$ CenterScreen=�5   	    � WindowState$ 	Maximized=�6.   $
��1154��6F   $	��701��6S    � DataContext 5      .   (Logopédia_WPF.ViewModels.LoginViewModel  5   
   .��5      �� ���#d4d3d3 �� CornerRadius$ 20��6"   $��80q�64    J� BitmapEffect 5   
   F� 5       F� Color$ Black��6%   	 F� 	Direction$		 320Q�63   
 F� ShadowDepth$
 13Q�6C    F� Softness$	 0.4Q�6T   ._�5   
   �� $��30q�6   $��Center=�6!   $��Center=�6>   .+�5      �� $��Bejelentkezés��6   
���   �$��50(�6?   $
��Bold"�6M   $��Center=�6_   �� 5      ���#10bbe6$��50��6-   6;   �� 5      $��Felhasználónév��6   
���   �$��25(�6@   $
��Bold"�6N   �� 5       �� Orientation$ 
Horizontal=�6   $��20q�62   .+�5!      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$
 User=�6*   $��30��66   $��30��6A   
���   �6M   �� 5"      $
��10 0q�6:   $	��500��6H   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$# Adja meg felhasználónevét!��6T   
���   �
���   �$��20(�6�   $
��Bold"�6�   ��6   �� *Felhasznalonev+6�   5$      �� 5&      $��Jelszó��6   
���   �$��25(�68   $
��Bold"�6F   �� 5(      $ 
Horizontal=�6   $��20q�62   .+�5*        $
 Lock=�6*   $��30��66   $��30��6A   
���   �6M   G� 5+      -   5         G�Name$ pwdBox��5+      $
��10 0q�6\   $	��500��6j   $ ********��6v   
���   �
���   �$��20(�6�    J� InputBindings 5,      �� 5-      
 �� Key$ Return��6%    �� Command 62   �� *LoginCommand+5/      51      �� 53      $ 
Horizontal=�6   .+�55      �� ���#10bbe6   MaterialDesignRaisedButton#��[  6O   $��	Belépés��6�   $��60 30q�6�   $	��147��6�   $
��Left=�6�   +  %MaterialDesignThemes.Wpf.ButtonAssist   CornerRadius$ 15��56      
���   �$��26(�6W   $��44��6e    � Cursor$
 Hand��6q   ��55      �� *LoginCommand+ 57      F� 58      $ Black��61   $		 320Q�6?   $
 13Q�6O   $	 0.4Q�6`   5:      �� 5<       & "MaterialDesignFloatingActionButton#��[ 6:   ���#669999 � ToolTip$ Close��6�   $��Right=�6�   $��
100 0 10 0q�6�   $
 Hand��6�   ��6   �� *CloseCommand+.��5=        $ Close=�6.   
���   �$��40��6N    5>      F� 5?      $ Black��61   $		 320Q�6?   $
 13Q�6O   $	 0.4Q�6`   5A      �� 5C      $��	Bezárás��6   
���   �$��Center=�6=   $
��Bold"�6X   5E      �� 5G      $��40��64   $	��0 5q�6@   $
��Bold"�6M   $��Center=�6_   $
��Wrap=�6|   $��Bottom=�6�    J� OpacityMask
 �<�����	#FFE5572C��6   �� *HibaÜzenet+6�   5I      5K      5M      