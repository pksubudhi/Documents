
main:

	lui   $t0, 0				# Counter variable for outer loop
	move  $t1, $s0
outer_loop:
	
	lw   $t2, 0($t1)			# getting value of the element to $t2
	
	bne  $t2, $s2, move_on		# Checking if the element is the serch element (val) which is in $s2
								# If not that then simply moving on
								# If found then we have to remove by left shifting elements
	
	# Shifting all elements then onward towards it's left if the search element found
	
	move $t2, $t1				# $t1 is another counter variable for inner loop
	move $t6, $t0
	addi $t7, $s1, -1			# We take $t4 = (n-1), because to move upto penaltimate element
	
inner_loop:
	addi $t3, $t2, 4			
	lw   $t4, 0($t3)			# Getting right most element data	
	sw   $t4, 0($t2)			# Moving the right most data to current positionn
	
	addi $t2, $t2, 4
	addi $t6, $t6, 1			# Incrementing counter
	blt  $t6, $t7, inner_loop
	
	addi  $s1, $s1, -1			# Decrementing array size
	j next_part					# Jump to continue outer loop
	
move_on:
	addi $t0, $t0, 1			# Incrementing counter for outer loop
	addi $t1, $t1, 4
next_part:
	blt  $t0, $s1, outer_loop
	
	jr 	 $ra					# Stop


