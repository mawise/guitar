Guitar Chords
=============

These are guitar chords for various songs that I've been collecting.  This repo serves as my own modern-day equivalent to my Dad's red binder of songs he collected.

Feel free to send me pull requets if you want me to learn a song!

read.rb
-------

There is also a script included: `read.rb`. Given a terminal display, you can use this script to display a text file in multiple columns.  Chords tend to be fairly narrow files, but I would like to be able to see more than one screen-height worth of content at once. The default is to display two columns on a screen that is 36 characters tall and 149 characters wide. You can edit the file to change the defaults according to your screen, or you can pass in additional parameters to the script at run-time.

Usage: `./read.rb <filename> [columns] [screen-rows] [screen-columns]`

The filename is a required parameter, the other parameters override default values.  Once the display is running, you can hit `Enter` to scroll by one column, if you scroll past the end of the file, the script exits.  You can hit `[Space] Enter` or `[b] Enter` to scroll back by a column.  `[q] Enter` exits the script.
