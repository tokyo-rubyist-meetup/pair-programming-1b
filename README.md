# Japanese Era Calendar Scheme

## 日本語暦変換プログラム

If you've ever had to fill out paperwork in Japan, you know that the country uses two systems for counting dates: the western [Gregorian calendar](http://en.wikipedia.org/wiki/Gregorian_calendar), and the [Japanese era calendar scheme](http://en.wikipedia.org/wiki/Japanese_era_name), which uses the combination of the reigning Emperor's name and year since his birth.

Write a program that takes a Gregorian date as an input, give the Japanese era date as an output. For example, with 2012-10-20 as an input, the output would be 平成24年10月20日.

To get you started, I've reproduced part of [a table of era information](http://www.kumamotokokufu-h.ed.jp/kumamoto/bungaku/nengoui.html).

年号 | 西暦       | 改元日 | 備考
---- | ---------- | ------ | ---------------------------------------
明治 | 1868～1912 | 9/8    | 明治元年は1/1から。明治６年以降は太陽暦
大正 | 1912～1926 | 7/30   |
昭和 | 1926～1989 | 12/25  | 昭和６４年は１月７日まで
平成 | 1989～     | 1/8    |

* 明治５年１２月２日まで太陰太陽暦（旧暦）を使用。
* 明治５年１１月９日の「太政官布告」により、太陽暦(グレゴリオ暦)に改暦され、「明治５年１２月２日」の翌日が「明治６年１月１日」。
 「明治改元の布告」、大正や昭和の「改元の詔書」によると
  明治改元の詔書が出されたのは慶応４年９月８日だが、明治元年は「１月１日」から、即ち９月８日まで」は慶応４年でも明治元年でも。「明治４５年７月３０日」と「大正元年７月３０日」及び「大正１５年１２月２５日」と「昭和元年１２月２５日」は、ともに存在。
* 「元号を改める政令（昭和６４年１月７日）」によると
　昭和６４年は「１月７日」までで、平成元年は「１月８日」から。

## Extensions

Once you've completed the above, try out some of the following extensions.

### All the eras

The first Japanese era started in 645. Take a look at [the table of era information](http://www.kumamotokokufu-h.ed.jp/kumamoto/bungaku/nengoui.html), and see if you can cover all of them.

### Kanji Numerals

Write your dates only using Kanji! For instance, 2012-10-20 becomes 平成二十四年十月二十日.

### Pronunciation of Dates

Have an option to output the reading of the dates. For instance, 2012-10-20 becomes へいせいにじゅうねんじゅうがつはつか.
