   M S B A M L   `   `   `  ����I  ELogopédia_WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Logopédia_WPF.ViewsLogopédia_WPF.Views  5   	   E'clr-namespace:Logopédia_WPF.ViewModelsLogopédia_WPF.ViewModels  5   	   %    Logopédia_WPF.Views.AdatokView   5   	   W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:Logopédia_WPF.Views     5   	   6vm'clr-namespace:Logopédia_WPF.ViewModels     5   	   _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   ���#10bbe6$	��671��5	   /   $
��1295��6<     � WindowStartupLocation$  CenterScreen=�5
   	    � DataContext 5      /   )Logopédia_WPF.ViewModels.AdatokViewModel  5   
   .��5      �� ���#d4d3d3 �� CornerRadius$ 30��6"   $��30q�64    J� BitmapEffect 5   
   F� 5       F� Color$ Black��6%    F� 	Direction$	 320Q�63    F� ShadowDepth$ 13Q�6C    F� Softness$	 0.4Q�6T   ._�5   
   �� $��Center=�6   $��Center=�62   ���#d4d3d3.+�5      �� $��A gyermek adatai��6   $��Center=�6/   
���   �$��10q�6_   $��40(�6k   $��	ExtraBold"�6y   �� 5      $��120 0q�6   ���#10bbe66>   � 5      $��20q�6    � 	Resources 5      	 �� 
TargetType
 �� Property �� Value��%�  '��       '�� o     �� 5      "	 ��6   .�5      �� 
 � ��$ 15(�65   �� 5      
 � ��$ Heavy"�67   5       �� 5!      "	 ��6   .�5"      �� 
 �@��
IsReadOnly$
 True��67   �� 5#      
 � ��$ 15(�65   �� 5$      
 � ��$ SemiBold"�67   �� 5%      
 � �� �#d4d3d367   �� 5&      
 � ��$ 0q�6<   �� 5'      
 � ��$ Center=�6G   5(      5)       � ColumnDefinitions 5*      �� 5+      $	��160 �6'   �� 5,      $	��190 �6'   �� 5-      $��50 �6'   �� 5.      $	��200 �6'   �� 5/      $	��175 �6'    � RowDefinitions 51      �� 52      $��* �6$   �� 53      $��* �6$   �� 54      $��* �6$   �� 55      $��* �6$   �� 56      $��* �6$   �� 57      $��* �6$   .+�59      �� $��0��6   $��0��6%   $��Oktatási azonosító:��65   �� 5:      -   5         ��Name$ 	azonosito��5:   d   $��0��6   $��1��6'   ��67   �� *Gyerekek.oktatasi_azonosito+6d   �� 5;      $��1��6   $��0��6%   $��A gyermek neve:��65   �� 5<      -   5        $ 
gyerekNeve��5<   ]   $��1��6   $��1��6'   ��67   �� *Gyerekek.gyerek_neve+6]   �� 5=      $��2��6   $��0��6%   $��Születési helye:��65   �� 5>      -   5        $ 	szul_hely��5>   [   $��2��6   $��1��6'   ��67   �� *Gyerekek.szul_hely+6[   �� 5?      $��3��6   $��0��6%   $��Születési ideje:��65   �� 5@      -   5        $ szul_ido��5@   x   $��3��6   $��1��6'   ��67   �� *Gyerekek.szul_ido+ �� StringFormat$ yyyy. MM. dd.��6x   �� 5A      $��4��6   $��0��6%   $��Anyja neve:��65   �� 5B      -   5        $ 	anyjaNeve��5B   \   $��4��6   $��1��6'   ��67   �� *Gyerekek.anyja_neve+6\   �� 5C      $��5��6   $��0��6%   $��	Lakcíme:��65   �� 5D      -   5        $ lakcim��5D   {   $��5��6   $��1��6'   $ �� HorizontalScrollBarVisibility$
 Auto=�6�   ��67   �� *42Gyerekek.elerhetosegIDNavigation.gondviselo_lakcim+6�   �� 5E      $��0��6   $��3��6%   $��Óvoda neve:��65   �� 5F      -   5        $ 	ovodaNeve��5F      $��0��6-   $��4��6:   ��6J   �� *'%Gyerekek.ovodaIDNavigation.ovoda_neve+�� 5G      -   5         ��Name$ 
ovodaCombo��5G      $��0��6/   $��4��6<   $y�Hidden=�5H       �� DisplayMemberPath$ 
ovoda_neve��5K      $
��Auto=�5L      $��15(�5M      $��SemiBold"�5N      ���#d4d3d3$��0q�5P      $��Center=�5Q       �� 
IsEditable$ False��5R      ��5I      �� *Ovodak+ �� SelectedItem 5J      �� *Gyerekek.ovodaIDNavigation+5R      �� 5S      $��1��6   $��3��6%   $��Óvoda telefonszáma:��65   �� 5T      -	   5        $ 
ovodaSzama��5T   r   $��1��6   $��4��6'   ��67   �� *+)Gyerekek.ovodaIDNavigation.ovoda_telszama+6r   �� 5U      $��2��6   $��3��6%   $��Gondviselő neve:��65   �� 5V      -
   5        $ gondviseloNeve��5V   y   $��2��6   $��4��6'   ��67   �� *31Gyerekek.elerhetosegIDNavigation.gondviselő_neve+6y   �� 5W      $��3��6   $��3��6%   $!��Gondviselő telefonszáma: ��65   �� 5X      -   5        $ gondviseloSzama��5X   �   $��3��6   $��4��6'   ��67   �� *97Gyerekek.elerhetosegIDNavigation.gondviselo_telefonszam+6�   �� 5Y      $��4��6   $��3��6%   $��Diagnózis megnevezése:��65   �� 5Z      -   5        $ diagnozisNeve��5Z   �   $��4��6   $��4��6'   $
 Auto=�6}   ��67   �� *64Gyerekek.diagnozisIDNavigation.diagnozis_megnevezese+6�   �� 5[      -   5        $ diagnozisCombo��5[      $��4��63   $��4��6@   $y�Hidden=�5\      $ diagnozis_megnevezese��5_      $
��Auto=�6L   $��15(�5`      $��SemiBold"�5a      ���#d4d3d3$��0q�5c      $��Center=�5d      ��5]      �� *Diagnozisok+ 5^      �� * Gyerekek.diagnozisIDNavigation+5d      �� 5f      $��5��6   $��3��6%   $��Diagnózis dátuma:��65   �� 5g      -   5        $ diagnozisDatuma��5g   �   $��5��6   $��4��6'   ��67   �� * Gyerekek.diagnozis_adas_datuma+$ yyyy. MM. dd.��6�   (  "System.Windows.Controls.DatePicker  5h      -   5          Name$ datum��5h   :   $��5��6   $��4��6*   $y�Hidden=�5i         IsTodayHighlighted$
 True��5j      $��15(�5k      $��SemiBold"�5l      ���#d4d3d3$��0q�5n      $��Center=�5o      5p      �� 5r       �� Orientation$ 
Horizontal=�6   $��Center=�62   .+�5s      �� -   5         ��Name$
 Edit��5s      ���#10bbe6   MaterialDesignRaisedButton#��[  6<   $��Szerkesztés��6p   $	��125��6�   +  %MaterialDesignThemes.Wpf.ButtonAssist   CornerRadius$ 15��6�   
���   �$��	ExtraBold"�6�   $��15(�6�   $��30��6�   $��60 20q�6   � Cursor$
 Hand��6   5t      F� 5u      $ Black��61   $	 320Q�6?   $ 13Q�6O   $	 0.4Q�6`   5w      �� 5x      ���#10bbe6#��[  6N   $��Mentés��6�   $	��125��6�   $ 15��6�   
���   �$��	ExtraBold"�6�   $��15(�6�   $��30��6  $��60 20q�6  $
 Hand��6   ��6   �� *SaveCommand+ 5y      F� 5z      $ Black��61   $	 320Q�6?   $ 13Q�6O   $	 0.4Q�6`   5|      �� 5}      
�������#��[  6�   $��	Bezárás��6�   $	��125��6�   $ 15��6
  
���   �$��	ExtraBold"�6K  $��15(�6b  $��30��6p  $��60 20q�6|  $
 Hand��6�  ��6   �� *CloseCommand+��6:   ��  �� RelativeSource �� *FindAncestor+ �� AncestorType" � 5~      F� 5      $ Black��61   $	 320Q�6?   $ 13Q�6O   $	 0.4Q�6`   5�      5�      �� 5�      $��5q�65   $��30(�6@   $
��Bold"�6N   $��Center=�6`   $
��Wrap=�6}    J� OpacityMask
 �<�����	#FFE5572C��6   �� *SaveMessage+6�   5�      5�      5�      