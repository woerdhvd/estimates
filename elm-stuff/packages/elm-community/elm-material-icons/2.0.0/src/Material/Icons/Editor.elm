module Material.Icons.Editor exposing (..)

{-|

# Icons
@docs attach_file
@docs attach_money
@docs border_all
@docs border_bottom
@docs border_clear
@docs border_color
@docs border_horizontal
@docs border_inner
@docs border_left
@docs border_outer
@docs border_right
@docs border_style
@docs border_top
@docs border_vertical
@docs format_align_center
@docs format_align_justify
@docs format_align_left
@docs format_align_right
@docs format_bold
@docs format_clear
@docs format_color_fill
@docs format_color_reset
@docs format_color_text
@docs format_indent_decrease
@docs format_indent_increase
@docs format_italic
@docs format_line_spacing
@docs format_list_bulleted
@docs format_list_numbered
@docs format_paint
@docs format_quote
@docs format_size
@docs format_strikethrough
@docs format_textdirection_l_to_r
@docs format_textdirection_r_to_l
@docs format_underlined
@docs functions
@docs insert_chart
@docs insert_comment
@docs insert_drive_file
@docs insert_emoticon
@docs insert_invitation
@docs insert_link
@docs insert_photo
@docs merge_type
@docs mode_comment
@docs mode_edit
@docs money_off
@docs publish
@docs space_bar
@docs strikethrough_s
@docs vertical_align_bottom
@docs vertical_align_center
@docs vertical_align_top
@docs wrap_text


-}

import Svg                      exposing (Svg)
import Svg.Attributes
import Color                    exposing (Color)
import Material.Icons.Internal  exposing (icon, toRgbaString)
import VirtualDom
{-|-}
attach_file : Color -> Int -> Svg msg
attach_file =
  icon "M16.5 6v11.5c0 2.21-1.79 4-4 4s-4-1.79-4-4V5c0-1.38 1.12-2.5 2.5-2.5s2.5 1.12 2.5 2.5v10.5c0 .55-.45 1-1 1s-1-.45-1-1V6H10v9.5c0 1.38 1.12 2.5 2.5 2.5s2.5-1.12 2.5-2.5V5c0-2.21-1.79-4-4-4S7 2.79 7 5v12.5c0 3.04 2.46 5.5 5.5 5.5s5.5-2.46 5.5-5.5V6h-1.5z"
{-|-}
attach_money : Color -> Int -> Svg msg
attach_money =
  icon "M11.8 10.9c-2.27-.59-3-1.2-3-2.15 0-1.09 1.01-1.85 2.7-1.85 1.78 0 2.44.85 2.5 2.1h2.21c-.07-1.72-1.12-3.3-3.21-3.81V3h-3v2.16c-1.94.42-3.5 1.68-3.5 3.61 0 2.31 1.91 3.46 4.7 4.13 2.5.6 3 1.48 3 2.41 0 .69-.49 1.79-2.7 1.79-2.06 0-2.87-.92-2.98-2.1h-2.2c.12 2.19 1.76 3.42 3.68 3.83V21h3v-2.15c1.95-.37 3.5-1.5 3.5-3.55 0-2.84-2.43-3.81-4.7-4.4z"
{-|-}
border_all : Color -> Int -> Svg msg
border_all =
  icon "M3 3v18h18V3H3zm8 16H5v-6h6v6zm0-8H5V5h6v6zm8 8h-6v-6h6v6zm0-8h-6V5h6v6z"
{-|-}
border_bottom : Color -> Int -> Svg msg
border_bottom =
  icon "M9 11H7v2h2v-2zm4 4h-2v2h2v-2zM9 3H7v2h2V3zm4 8h-2v2h2v-2zM5 3H3v2h2V3zm8 4h-2v2h2V7zm4 4h-2v2h2v-2zm-4-8h-2v2h2V3zm4 0h-2v2h2V3zm2 10h2v-2h-2v2zm0 4h2v-2h-2v2zM5 7H3v2h2V7zm14-4v2h2V3h-2zm0 6h2V7h-2v2zM5 11H3v2h2v-2zM3 21h18v-2H3v2zm2-6H3v2h2v-2z"
{-|-}
border_clear : Color -> Int -> Svg msg
border_clear =
  icon "M7 5h2V3H7v2zm0 8h2v-2H7v2zm0 8h2v-2H7v2zm4-4h2v-2h-2v2zm0 4h2v-2h-2v2zm-8 0h2v-2H3v2zm0-4h2v-2H3v2zm0-4h2v-2H3v2zm0-4h2V7H3v2zm0-4h2V3H3v2zm8 8h2v-2h-2v2zm8 4h2v-2h-2v2zm0-4h2v-2h-2v2zm0 8h2v-2h-2v2zm0-12h2V7h-2v2zm-8 0h2V7h-2v2zm8-6v2h2V3h-2zm-8 2h2V3h-2v2zm4 16h2v-2h-2v2zm0-8h2v-2h-2v2zm0-8h2V3h-2v2z"
{-|-}
border_color : Color -> Int -> Svg msg
border_color color size =
  let
      stringColor = toRgbaString color
      stringSize  = toString size
  in
      Svg.svg
          [ Svg.Attributes.width stringSize
          , Svg.Attributes.height stringSize
          , Svg.Attributes.viewBox "0 0 24 24"
          ]
          [ Svg.path
                [ Svg.Attributes.d "M17.75 7L14 3.25l-10 10V17h3.75l10-10zm2.96-2.96c.39-.39.39-1.02 0-1.41L18.37.29c-.39-.39-1.02-.39-1.41 0L15 2.25 18.75 6l1.96-1.96z"
                , Svg.Attributes.fill stringColor
                ]
                []
          , Svg.path
                [ Svg.Attributes.fillOpacity ".36"
                , Svg.Attributes.d "M0 20h24v4H0z"
                , Svg.Attributes.fill stringColor
                ]
                []
          ]
{-|-}
border_horizontal : Color -> Int -> Svg msg
border_horizontal =
  icon "M3 21h2v-2H3v2zM5 7H3v2h2V7zM3 17h2v-2H3v2zm4 4h2v-2H7v2zM5 3H3v2h2V3zm4 0H7v2h2V3zm8 0h-2v2h2V3zm-4 4h-2v2h2V7zm0-4h-2v2h2V3zm6 14h2v-2h-2v2zm-8 4h2v-2h-2v2zm-8-8h18v-2H3v2zM19 3v2h2V3h-2zm0 6h2V7h-2v2zm-8 8h2v-2h-2v2zm4 4h2v-2h-2v2zm4 0h2v-2h-2v2z"
{-|-}
border_inner : Color -> Int -> Svg msg
border_inner =
  icon "M3 21h2v-2H3v2zm4 0h2v-2H7v2zM5 7H3v2h2V7zM3 17h2v-2H3v2zM9 3H7v2h2V3zM5 3H3v2h2V3zm12 0h-2v2h2V3zm2 6h2V7h-2v2zm0-6v2h2V3h-2zm-4 18h2v-2h-2v2zM13 3h-2v8H3v2h8v8h2v-8h8v-2h-8V3zm6 18h2v-2h-2v2zm0-4h2v-2h-2v2z"
{-|-}
border_left : Color -> Int -> Svg msg
border_left =
  icon "M11 21h2v-2h-2v2zm0-4h2v-2h-2v2zm0-12h2V3h-2v2zm0 4h2V7h-2v2zm0 4h2v-2h-2v2zm-4 8h2v-2H7v2zM7 5h2V3H7v2zm0 8h2v-2H7v2zm-4 8h2V3H3v18zM19 9h2V7h-2v2zm-4 12h2v-2h-2v2zm4-4h2v-2h-2v2zm0-14v2h2V3h-2zm0 10h2v-2h-2v2zm0 8h2v-2h-2v2zm-4-8h2v-2h-2v2zm0-8h2V3h-2v2z"
{-|-}
border_outer : Color -> Int -> Svg msg
border_outer =
  icon "M13 7h-2v2h2V7zm0 4h-2v2h2v-2zm4 0h-2v2h2v-2zM3 3v18h18V3H3zm16 16H5V5h14v14zm-6-4h-2v2h2v-2zm-4-4H7v2h2v-2z"
{-|-}
border_right : Color -> Int -> Svg msg
border_right =
  icon "M7 21h2v-2H7v2zM3 5h2V3H3v2zm4 0h2V3H7v2zm0 8h2v-2H7v2zm-4 8h2v-2H3v2zm8 0h2v-2h-2v2zm-8-8h2v-2H3v2zm0 4h2v-2H3v2zm0-8h2V7H3v2zm8 8h2v-2h-2v2zm4-4h2v-2h-2v2zm4-10v18h2V3h-2zm-4 18h2v-2h-2v2zm0-16h2V3h-2v2zm-4 8h2v-2h-2v2zm0-8h2V3h-2v2zm0 4h2V7h-2v2z"
{-|-}
border_style : Color -> Int -> Svg msg
border_style =
  icon "M15 21h2v-2h-2v2zm4 0h2v-2h-2v2zM7 21h2v-2H7v2zm4 0h2v-2h-2v2zm8-4h2v-2h-2v2zm0-4h2v-2h-2v2zM3 3v18h2V5h16V3H3zm16 6h2V7h-2v2z"
{-|-}
border_top : Color -> Int -> Svg msg
border_top =
  icon "M7 21h2v-2H7v2zm0-8h2v-2H7v2zm4 0h2v-2h-2v2zm0 8h2v-2h-2v2zm-8-4h2v-2H3v2zm0 4h2v-2H3v2zm0-8h2v-2H3v2zm0-4h2V7H3v2zm8 8h2v-2h-2v2zm8-8h2V7h-2v2zm0 4h2v-2h-2v2zM3 3v2h18V3H3zm16 14h2v-2h-2v2zm-4 4h2v-2h-2v2zM11 9h2V7h-2v2zm8 12h2v-2h-2v2zm-4-8h2v-2h-2v2z"
{-|-}
border_vertical : Color -> Int -> Svg msg
border_vertical =
  icon "M3 9h2V7H3v2zm0-4h2V3H3v2zm4 16h2v-2H7v2zm0-8h2v-2H7v2zm-4 0h2v-2H3v2zm0 8h2v-2H3v2zm0-4h2v-2H3v2zM7 5h2V3H7v2zm12 12h2v-2h-2v2zm-8 4h2V3h-2v18zm8 0h2v-2h-2v2zm0-8h2v-2h-2v2zm0-10v2h2V3h-2zm0 6h2V7h-2v2zm-4-4h2V3h-2v2zm0 16h2v-2h-2v2zm0-8h2v-2h-2v2z"
{-|-}
format_align_center : Color -> Int -> Svg msg
format_align_center =
  icon "M7 15v2h10v-2H7zm-4 6h18v-2H3v2zm0-8h18v-2H3v2zm4-6v2h10V7H7zM3 3v2h18V3H3z"
{-|-}
format_align_justify : Color -> Int -> Svg msg
format_align_justify =
  icon "M3 21h18v-2H3v2zm0-4h18v-2H3v2zm0-4h18v-2H3v2zm0-4h18V7H3v2zm0-6v2h18V3H3z"
{-|-}
format_align_left : Color -> Int -> Svg msg
format_align_left =
  icon "M15 15H3v2h12v-2zm0-8H3v2h12V7zM3 13h18v-2H3v2zm0 8h18v-2H3v2zM3 3v2h18V3H3z"
{-|-}
format_align_right : Color -> Int -> Svg msg
format_align_right =
  icon "M3 21h18v-2H3v2zm6-4h12v-2H9v2zm-6-4h18v-2H3v2zm6-4h12V7H9v2zM3 3v2h18V3H3z"
{-|-}
format_bold : Color -> Int -> Svg msg
format_bold =
  icon "M15.6 10.79c.97-.67 1.65-1.77 1.65-2.79 0-2.26-1.75-4-4-4H7v14h7.04c2.09 0 3.71-1.7 3.71-3.79 0-1.52-.86-2.82-2.15-3.42zM10 6.5h3c.83 0 1.5.67 1.5 1.5s-.67 1.5-1.5 1.5h-3v-3zm3.5 9H10v-3h3.5c.83 0 1.5.67 1.5 1.5s-.67 1.5-1.5 1.5z"
{-|-}
format_clear : Color -> Int -> Svg msg
format_clear =
  icon "M3.27 5L2 6.27l6.97 6.97L6.5 19h3l1.57-3.66L16.73 21 18 19.73 3.55 5.27 3.27 5zM6 5v.18L8.82 8h2.4l-.72 1.68 2.1 2.1L14.21 8H20V5H6z"
{-|-}
format_color_fill : Color -> Int -> Svg msg
format_color_fill color size =
  let
      stringColor = toRgbaString color
      stringSize  = toString size
  in
      Svg.svg
          [ Svg.Attributes.width stringSize
          , Svg.Attributes.height stringSize
          , Svg.Attributes.viewBox "0 0 24 24"
          ]
          [ Svg.path
                [ Svg.Attributes.d "M16.56 8.94L7.62 0 6.21 1.41l2.38 2.38-5.15 5.15c-.59.59-.59 1.54 0 2.12l5.5 5.5c.29.29.68.44 1.06.44s.77-.15 1.06-.44l5.5-5.5c.59-.58.59-1.53 0-2.12zM5.21 10L10 5.21 14.79 10H5.21zM19 11.5s-2 2.17-2 3.5c0 1.1.9 2 2 2s2-.9 2-2c0-1.33-2-3.5-2-3.5z"
                , Svg.Attributes.fill stringColor
                ]
                []
          , Svg.path
                [ Svg.Attributes.fillOpacity ".36"
                , Svg.Attributes.d "M0 20h24v4H0z"
                , Svg.Attributes.fill stringColor
                ]
                []
          ]
{-|-}
format_color_reset : Color -> Int -> Svg msg
format_color_reset =
  icon "M18 14c0-4-6-10.8-6-10.8s-1.33 1.51-2.73 3.52l8.59 8.59c.09-.42.14-.86.14-1.31zm-.88 3.12L12.5 12.5 5.27 5.27 4 6.55l3.32 3.32C6.55 11.32 6 12.79 6 14c0 3.31 2.69 6 6 6 1.52 0 2.9-.57 3.96-1.5l2.63 2.63 1.27-1.27-2.74-2.74z"
{-|-}
format_color_text : Color -> Int -> Svg msg
format_color_text color size =
  let
      stringColor = toRgbaString color
      stringSize  = toString size
  in
      Svg.svg
          [ Svg.Attributes.width stringSize
          , Svg.Attributes.height stringSize
          , Svg.Attributes.viewBox "0 0 24 24"
          ]
          [ Svg.path
                [ Svg.Attributes.d "M0 20h24v4H0z"
                , Svg.Attributes.fill stringColor
                , Svg.Attributes.fillOpacity ".36"
                ]
                []
          , Svg.path
                [ Svg.Attributes.d "M11 3L5.5 17h2.25l1.12-3h6.25l1.12 3h2.25L13 3h-2zm-1.38 9L12 5.67 14.38 12H9.62z"
                , Svg.Attributes.fill stringColor
                ]
                []
          ]
{-|-}
format_indent_decrease : Color -> Int -> Svg msg
format_indent_decrease =
  icon "M11 17h10v-2H11v2zm-8-5l4 4V8l-4 4zm0 9h18v-2H3v2zM3 3v2h18V3H3zm8 6h10V7H11v2zm0 4h10v-2H11v2z"
{-|-}
format_indent_increase : Color -> Int -> Svg msg
format_indent_increase =
  icon "M3 21h18v-2H3v2zM3 8v8l4-4-4-4zm8 9h10v-2H11v2zM3 3v2h18V3H3zm8 6h10V7H11v2zm0 4h10v-2H11v2z"
{-|-}
format_italic : Color -> Int -> Svg msg
format_italic =
  icon "M10 4v3h2.21l-3.42 8H6v3h8v-3h-2.21l3.42-8H18V4z"
{-|-}
format_line_spacing : Color -> Int -> Svg msg
format_line_spacing =
  icon "M6 7h2.5L5 3.5 1.5 7H4v10H1.5L5 20.5 8.5 17H6V7zm4-2v2h12V5H10zm0 14h12v-2H10v2zm0-6h12v-2H10v2z"
{-|-}
format_list_bulleted : Color -> Int -> Svg msg
format_list_bulleted =
  icon "M4 10.5c-.83 0-1.5.67-1.5 1.5s.67 1.5 1.5 1.5 1.5-.67 1.5-1.5-.67-1.5-1.5-1.5zm0-6c-.83 0-1.5.67-1.5 1.5S3.17 7.5 4 7.5 5.5 6.83 5.5 6 4.83 4.5 4 4.5zm0 12.17c-.74 0-1.33.6-1.33 1.33s.6 1.33 1.33 1.33 1.33-.6 1.33-1.33-.59-1.33-1.33-1.33zM7 19h14v-2H7v2zm0-6h14v-2H7v2zm0-8v2h14V5H7z"
{-|-}
format_list_numbered : Color -> Int -> Svg msg
format_list_numbered =
  icon "M2 17h2v.5H3v1h1v.5H2v1h3v-4H2v1zm1-9h1V4H2v1h1v3zm-1 3h1.8L2 13.1v.9h3v-1H3.2L5 10.9V10H2v1zm5-6v2h14V5H7zm0 14h14v-2H7v2zm0-6h14v-2H7v2z"
{-|-}
format_paint : Color -> Int -> Svg msg
format_paint =
  icon "M18 4V3c0-.55-.45-1-1-1H5c-.55 0-1 .45-1 1v4c0 .55.45 1 1 1h12c.55 0 1-.45 1-1V6h1v4H9v11c0 .55.45 1 1 1h2c.55 0 1-.45 1-1v-9h8V4h-3z"
{-|-}
format_quote : Color -> Int -> Svg msg
format_quote =
  icon "M6 17h3l2-4V7H5v6h3zm8 0h3l2-4V7h-6v6h3z"
{-|-}
format_size : Color -> Int -> Svg msg
format_size =
  icon "M9 4v3h5v12h3V7h5V4H9zm-6 8h3v7h3v-7h3V9H3v3z"
{-|-}
format_strikethrough : Color -> Int -> Svg msg
format_strikethrough =
  icon "M10 19h4v-3h-4v3zM5 4v3h5v3h4V7h5V4H5zM3 14h18v-2H3v2z"
{-|-}
format_textdirection_l_to_r : Color -> Int -> Svg msg
format_textdirection_l_to_r =
  icon "M9 10v5h2V4h2v11h2V4h2V2H9C6.79 2 5 3.79 5 6s1.79 4 4 4zm12 8l-4-4v3H5v2h12v3l4-4z"
{-|-}
format_textdirection_r_to_l : Color -> Int -> Svg msg
format_textdirection_r_to_l =
  icon "M10 10v5h2V4h2v11h2V4h2V2h-8C7.79 2 6 3.79 6 6s1.79 4 4 4zm-2 7v-3l-4 4 4 4v-3h12v-2H8z"
{-|-}
format_underlined : Color -> Int -> Svg msg
format_underlined =
  icon "M12 17c3.31 0 6-2.69 6-6V3h-2.5v8c0 1.93-1.57 3.5-3.5 3.5S8.5 12.93 8.5 11V3H6v8c0 3.31 2.69 6 6 6zm-7 2v2h14v-2H5z"
{-|-}
functions : Color -> Int -> Svg msg
functions =
  icon "M18 4H6v2l6.5 6L6 18v2h12v-3h-7l5-5-5-5h7z"
{-|-}
insert_chart : Color -> Int -> Svg msg
insert_chart =
  icon "M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zM9 17H7v-7h2v7zm4 0h-2V7h2v10zm4 0h-2v-4h2v4z"
{-|-}
insert_comment : Color -> Int -> Svg msg
insert_comment =
  icon "M20 2H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h14l4 4V4c0-1.1-.9-2-2-2zm-2 12H6v-2h12v2zm0-3H6V9h12v2zm0-3H6V6h12v2z"
{-|-}
insert_drive_file : Color -> Int -> Svg msg
insert_drive_file =
  icon "M6 2c-1.1 0-1.99.9-1.99 2L4 20c0 1.1.89 2 1.99 2H18c1.1 0 2-.9 2-2V8l-6-6H6zm7 7V3.5L18.5 9H13z"
{-|-}
insert_emoticon : Color -> Int -> Svg msg
insert_emoticon =
  icon "M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm3.5-9c.83 0 1.5-.67 1.5-1.5S16.33 8 15.5 8 14 8.67 14 9.5s.67 1.5 1.5 1.5zm-7 0c.83 0 1.5-.67 1.5-1.5S9.33 8 8.5 8 7 8.67 7 9.5 7.67 11 8.5 11zm3.5 6.5c2.33 0 4.31-1.46 5.11-3.5H6.89c.8 2.04 2.78 3.5 5.11 3.5z"
{-|-}
insert_invitation : Color -> Int -> Svg msg
insert_invitation =
  icon "M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"
{-|-}
insert_link : Color -> Int -> Svg msg
insert_link =
  icon "M3.9 12c0-1.71 1.39-3.1 3.1-3.1h4V7H7c-2.76 0-5 2.24-5 5s2.24 5 5 5h4v-1.9H7c-1.71 0-3.1-1.39-3.1-3.1zM8 13h8v-2H8v2zm9-6h-4v1.9h4c1.71 0 3.1 1.39 3.1 3.1s-1.39 3.1-3.1 3.1h-4V17h4c2.76 0 5-2.24 5-5s-2.24-5-5-5z"
{-|-}
insert_photo : Color -> Int -> Svg msg
insert_photo =
  icon "M21 19V5c0-1.1-.9-2-2-2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2zM8.5 13.5l2.5 3.01L14.5 12l4.5 6H5l3.5-4.5z"
{-|-}
merge_type : Color -> Int -> Svg msg
merge_type =
  icon "M17 20.41L18.41 19 15 15.59 13.59 17 17 20.41zM7.5 8H11v5.59L5.59 19 7 20.41l6-6V8h3.5L12 3.5 7.5 8z"
{-|-}
mode_comment : Color -> Int -> Svg msg
mode_comment =
  icon "M21.99 4c0-1.1-.89-2-1.99-2H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h14l4 4-.01-18z"
{-|-}
mode_edit : Color -> Int -> Svg msg
mode_edit =
  icon "M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"
{-|-}
money_off : Color -> Int -> Svg msg
money_off =
  icon "M12.5 6.9c1.78 0 2.44.85 2.5 2.1h2.21c-.07-1.72-1.12-3.3-3.21-3.81V3h-3v2.16c-.53.12-1.03.3-1.48.54l1.47 1.47c.41-.17.91-.27 1.51-.27zM5.33 4.06L4.06 5.33 7.5 8.77c0 2.08 1.56 3.21 3.91 3.91l3.51 3.51c-.34.48-1.05.91-2.42.91-2.06 0-2.87-.92-2.98-2.1h-2.2c.12 2.19 1.76 3.42 3.68 3.83V21h3v-2.15c.96-.18 1.82-.55 2.45-1.12l2.22 2.22 1.27-1.27L5.33 4.06z"
{-|-}
publish : Color -> Int -> Svg msg
publish =
  icon "M5 4v2h14V4H5zm0 10h4v6h6v-6h4l-7-7-7 7z"
{-|-}
space_bar : Color -> Int -> Svg msg
space_bar =
  icon "M18 9v4H6V9H4v6h16V9z"
{-|-}
strikethrough_s : Color -> Int -> Svg msg
strikethrough_s =
  icon "M5.9 10h6.3c-.8-.3-1.5-.6-2-.9-.7-.4-1-1-1-1.6 0-.3.1-.6.2-.9.1-.3.3-.5.6-.7.3-.2.6-.4 1-.5.4-.1.8-.2 1.4-.2.5 0 1 .1 1.4.2.4.1.7.3 1 .6.3.2.5.5.6.9.1.3.2.7.2 1.1h4c0-.9-.2-1.7-.5-2.4s-.8-1.4-1.4-1.9c-.6-.5-1.4-1-2.3-1.2-1-.4-2-.5-3.1-.5s-2 .1-2.9.4c-.9.3-1.6.6-2.3 1.1-.6.5-1.1 1-1.4 1.7-.4.7-.6 1.4-.6 2.2 0 .8.2 1.6.5 2.2.1.2.2.3.3.4zM23 12H1v2h11.9c.2.1.5.2.7.3.5.2.9.5 1.2.7.3.2.5.5.6.8.1.3.1.6.1.9 0 .3-.1.6-.2.9-.1.3-.3.5-.6.7-.2.2-.6.3-.9.5-.4.1-.8.2-1.4.2-.6 0-1.1-.1-1.6-.2s-.9-.3-1.2-.6c-.3-.3-.6-.6-.8-1-.2-.4-.3-1-.3-1.6h-4c0 .7.1 1.5.3 2.1.2.6.5 1.1.9 1.6s.8.9 1.3 1.2c.5.3 1 .6 1.6.9.6.2 1.2.4 1.8.5.6.1 1.3.2 1.9.2 1.1 0 2-.1 2.9-.4.9-.2 1.6-.6 2.2-1.1.6-.5 1.1-1 1.4-1.7.3-.7.5-1.4.5-2.3 0-.8-.1-1.5-.4-2.2-.1-.2-.1-.3-.2-.4H23v-2z"
{-|-}
vertical_align_bottom : Color -> Int -> Svg msg
vertical_align_bottom =
  icon "M16 13h-3V3h-2v10H8l4 4 4-4zM4 19v2h16v-2H4z"
{-|-}
vertical_align_center : Color -> Int -> Svg msg
vertical_align_center =
  icon "M8 19h3v4h2v-4h3l-4-4-4 4zm8-14h-3V1h-2v4H8l4 4 4-4zM4 11v2h16v-2H4z"
{-|-}
vertical_align_top : Color -> Int -> Svg msg
vertical_align_top =
  icon "M8 11h3v10h2V11h3l-4-4-4 4zM4 3v2h16V3H4z"
{-|-}
wrap_text : Color -> Int -> Svg msg
wrap_text =
  icon "M4 19h6v-2H4v2zM20 5H4v2h16V5zm-3 6H4v2h13.25c1.1 0 2 .9 2 2s-.9 2-2 2H15v-2l-3 3 3 3v-2h2c2.21 0 4-1.79 4-4s-1.79-4-4-4z"
