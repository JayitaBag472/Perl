#!/bin/bash
#!/usr/bin/perl
shopt -s xpg_echo

export funare_nm1

#==========Start of Segment Attributes vs Oracle Table Computation==========#

echo "\nFor unpacked segments and table columns, find the record difference between fields of segment and table in /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Details/SdiAttColUnp path."
find /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Details/SdiAttColUnp ! -type d \( -name '*' \) -print | xargs -i rm -rf {}
cat /dev/null > /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Logs/SegmentVsTableCompareTrack2_"$funare_nm1"
mkdir -p /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Details/SdiAttColUnp
perl /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Details/Programs/MergeColumeWise.pl /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Details/SegmentAttributeFilesTrack2_"$funare_nm1" /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Details/TableColumnFilesTrack2_"$funare_nm1" | perl -pe "s/(.*)/sdiff -s \$1/" > /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Details/AttributeColumnTrack2_SegTab_"$funare_nm1"
SdiUnpCou1=`perl -le 'print scalar(()=<>)' /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Details/AttributeColumnTrack2_SegTab_"$funare_nm1"`
SdiUnpCou2=1

while [ $((SdiUnpCou1)) -ge $((SdiUnpCou2)) ]
do
{
perl -ne "print if $SdiUnpCou2..$SdiUnpCou2" /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Details/AttributeColumnTrack2_SegTab_"$funare_nm1" > /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Logs/"SdiffQuery"_"Unpacked"_"$SdiUnpCou2"
SdiUnpCou5=`perl -lane 'print $F[2]' /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Logs/"SdiffQuery"_"Unpacked"_"$SdiUnpCou2" | perl -lane 'BEGIN{$,=""}$F[0]=~s/.*AttributeExtract\///;print @F' | perl -0777 -pe 's/((.*?-){2}).*/$1/s' | perl -lane 'BEGIN{$,=""}$F[0]=~s/-$//;print @F' | perl -ne 'print unless $a{$_}++'`
bash /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Logs/"SdiffQuery"_"Unpacked"_"$SdiUnpCou2" > /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Details/SdiAttColUnp/"$SdiUnpCou5" 2>&1
SdiUnpCou2=`expr "$SdiUnpCou2" + 1`
}
ls -lrth /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Details/SdiAttColUnp | sort -n -k 10 > /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Details/SdiAttColUnp/SdiffFile_"$funare_nm1"
done

perl -lane 'print "@F[5,9]"' /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Details/SdiAttColUnp/SdiffFile_"$funare_nm1" | perl -ne '!/SdiffFile_$funare_nm1|^[ \t]*$/ && print' | perl -lane 'print $F[0]' > /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Logs/"SdiffQuery"_"Deviations"_"SdiffFile_"$funare_nm1""
perl -lane 'print "@F[5,9]"' /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Details/SdiAttColUnp/SdiffFile_"$funare_nm1" | perl -ne '!/SdiffFile_$funare_nm1|^[ \t]*$/ && print' | perl -lane 'print $F[1]' > /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Logs/"SdiffQuery"_"AttributeColumn"_"SdiffFile_"$funare_nm1""
SdiUnpCou3=1
while [ $((SdiUnpCou1)) -ge $((SdiUnpCou3)) ]
do
{
perl -ne "print if $SdiUnpCou3..$SdiUnpCou3" /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Logs/"SdiffQuery"_"Deviations"_"SdiffFile_"$funare_nm1"" > /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Logs/"SdiffQuery"_"Deviations"_"$SdiUnpCou3"
perl -ne "print if $SdiUnpCou3..$SdiUnpCou3" /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Logs/"SdiffQuery"_"AttributeColumn"_"SdiffFile_"$funare_nm1"" > /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Logs/"SdiffQuery"_"Unpacked"_"$SdiUnpCou3"
SdiUnpCou6=`perl -lane 'BEGIN{$,=""}$F[0]=~s/.*AttributeExtract\///;print @F' /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Logs/"SdiffQuery"_"Unpacked"_"$SdiUnpCou3" | perl -0777 -pe 's/((.*?-){2}).*/$1/s' | perl -lane 'BEGIN{$,=""}$F[0]=~s/-$//;print @F' | perl -ne 'print unless $a{$_}++'`
SdiUnpCou4=`perl -pe 's/K//g|s/\.//g' /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Logs/"SdiffQuery"_"Deviations"_"$SdiUnpCou3"`
if [ $((SdiUnpCou4)) -eq 0 ]
then
echo "# "$SdiUnpCou6"-OK" >> /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Logs/SegmentVsTableCompareTrack2_"$funare_nm1"
else
echo "# "$SdiUnpCou6"-NOK" >> /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Logs/SegmentVsTableCompareTrack2_"$funare_nm1"
fi
SdiUnpCou3=`expr "$SdiUnpCou3" + 1`
}
done

# Segment vs Table Records Comparison:
perl -we 'print sort <>' /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Logs/SegmentVsTableCompareTrack2_"$funare_nm1" > /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Details/SegmentVsTableCompareTrack2_"$funare_nm1"
perl -ne 'print;' /project/SOMOS_DM_FT_NumberAdmin_Security_Track2/Details/SegmentVsTableCompareTrack2_"$funare_nm1"
