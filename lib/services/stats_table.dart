import 'package:flutter/material.dart';
import 'package:hero_characters/services/styledVariousText.dart';
import 'package:hero_characters/services/themes.dart';
import '../models/characters.dart';




class StatsTable extends StatefulWidget {
  const StatsTable(this.character,{super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [

          // available points
          Container(
            color: AppColors.secondaryColor,
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  size: 25,
                  color: widget.character.points <= 0 ? AppColors.textColor : AppColors.highlightColor,
                ),
                SizedBox(width: 20,),
                StyledText("Stat points available"),
                SizedBox(width: 20,),
                StyledHeading(widget.character.points.toString()),
              ],
            ),
          ),

          // stats_table
          SizedBox(height: 20,),
          Table(
            children: widget.character.statsAsList.map((stats) {
              return TableRow(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(0.6),
                ),
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding (
                        padding: EdgeInsets.symmetric(horizontal: 2,vertical: 6),
                      child:StyledHeading(stats["title"]!),
                    ),
                  ),

                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding (
                      padding: EdgeInsets.fromLTRB(20, 6, 0, 6),
                      child:StyledHeading(stats["value"]!),
                    ),
                  ),

                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.character.increaseStats(stats["title"]!);
                          });

                        },
                        icon: Icon(
                          Icons.arrow_upward,
                          color: AppColors.textColor,
                          size: 30,
                        ),
                    ),
                  ),

                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.character.decreaseStats(stats["title"]!);
                        });

                      },
                      icon: Icon(
                        Icons.arrow_downward,
                        color: AppColors.textColor,
                        size: 30,
                      ),
                    ),
                  ),
                ]
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
