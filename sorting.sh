#!/bin/bash

sorting ()
{
	all_files_2_arr ()
	{
		ar=()

		work_dir=$PWD
		IFS=$'\n'
		for a in $work_dir/*
			do
				if [[ -f $a ]]; then
	    			ar+=($(basename $a))
				fi
			done

		ar_length=${#ar[@]}
	}

	loop_select ()
	{

		compare_elems ()
		{
			itemI_noExt=$(basename ${ar[$i]%.*})
			itemII_noExt=$(basename ${ar[$j]%.*})

			add_2_res ()
			{	
				if [[ $mtch -gt 2 ]]; then
					res_ar+=(${ar[$i]})
					res_ar+=(${ar[$j]})
				fi

				mtch=0
			}

				for (( l=0; l<${#itemI_noExt}; l++ )); 
					do
						if [[ "${itemI_noExt:$l:1}" == "${itemII_noExt:$l:1}" ]];
						then
							(( mtch++ ))
						else
							break
						fi
					done

			add_2_res
		}

		for (( j=0; j<$ar_length; j++ )); 
			do
				if [[ $i == $j ]]; then
					continue
				else
					compare_elems
				fi
			done
	}

	naming ()
	{
		make_dir ()
		{
			move_2_dir ()
			{
				for w in ${uniq[@]}
					do
						if [ -f $w ]; then
							mv $w $dir_nme
						fi
					done 

				all_files_2_arr
			}

		dir_nme="$( echo $(basename ${uniq[$index]%.*}) | tr '[a-zа-я]' '[A-ZА-Я]' )"

		if [ ! -d $dir_nme ]; then
			mkdir $dir_nme
		fi

		if [ ! -z $index ]; then
			move_2_dir
		fi
		}

		uniq=($(printf "%s\n" "${res_ar[@]}" | sort -u))
		nme_length_indx=$(basename ${uniq[0]%.*})

		for (( z=0; z<${#uniq[@]}; z++ ));
			do
				no_ext="$(basename ${uniq[$z]%.*})"

				if [ ${#no_ext} -ge ${#nme_length_indx} ]; then
					index=$z
					nme_length_indx=$no_ext
				fi
			done

		make_dir
		res_ar=()
	}

	other_files ()
	{
		collect_files ()
		{
			for e in $work_dir/*
				do
					if [[ -f $e ]]; then
		    			mv $e OTHER
					fi
				done
		}

	if [ ! -d OTHER -a ! $ar_length -eq 0 ]; then
		mkdir OTHER
		collect_files
	fi

	echo "Sorting complete"
	}

	all_files_2_arr

	for (( i=0; i<$ar_length; i++ )); 
		do 
			loop_select

			if [ ${#res_ar[@]} -gt 0 ]; then
				naming
			fi
		done

	other_files
}

sorting
