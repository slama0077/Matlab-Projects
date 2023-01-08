


fprintf("1) \n\n")
fprintf("There are three points A, B, and C. And at each point, volume of traffic coming is considered positive and  volume of traffic going is negative. Then, we can set up three linear equations. \n\n")
fprintf("At point A: \n")
fprintf("x1 - x4 = 20\n")
fprintf("At point B: \n")
fprintf("x1 - x2 + x3 = 80\n")
fprintf("At point C: \n")
fprintf("-x2 + x4 = 20\n")
fprintf("Setting up a matrix for these system of equations:")
Vol =  [1 0 0 -1 20;1 -1 1 0 80;0 -1 0 1 35]
fprintf("Converting the matrix into equivalent reduced row echleon form:")
Vol = rref(Vol)
fprintf("Since column 4 does not have a pivot position, x4 is a free parameter. Let x4 = s1. \n")
fprintf("With backward substitution, we have: \n")
fprintf("x1 = 20 + s1\nx2 = -35 + s1\nx3 = 25\nx4 = s1\n")
fprintf("We know for the fact that the volume of traffic cannot be negative. So, as we can see from the relation x2 = -35 + s1, if s1<35, then x2 is going to be negative. Therefore, to make x2 non-negative, s1>=35.\n")
fprintf("And for minimum volume, we have to choose 35. Therefore, the minimum volume of traffic from C to A is 35. \n\n")


fprintf("2) \n")


fprintf("The encoding matrix is:")
A = [1 2 -1;2 5 -1;1 2 0]
fprintf("My original message is:")
message = 'hello world'
fprintf("Using conversion list to convert into numerical string. The result is:")
V = double(message - 96);
for i = 1:length(message)
    if(V(i) == -64)
        V(i) = 27;
    end
end
V
fprintf("Breaking V into column vectors of dimension 3x1 and adding spaces to match the dimension")
V = [8 12 23 12;5 15 15 4;12 27 18 27]
fprintf("Encoding the message by multiplying encoding matrix with the new matrix. The result is")
M = A * V;
M = [6 29 18 15 72 42 35 103 53 -7 17 20]


fprintf("3a) \n \n")
fprintf("The encoding matrix is:")
B = [1 -3 1 -2;2 -5 4 -2;-3 9 -2 5;4 -12 4 -7]
string = 'my name is Sonam and my favorite movie is shawshank redemption'
fprintf("To encode this text, first we have to convert the array of characters into corresponding array of integers such that a = 1, b = 2, and so on.\n")
fprintf("Plus, since the dimension of the encoding matrix is 4x4. We must pad the the array with necessary spaces (27) at the end. \n")
stringI = double(string - 96);
lengthI = length(stringI);
numCols = ceil(lengthI/4);
tempMatrix = 27*ones(1, numCols*4);
for i = 1:lengthI 
    if (stringI(i)== -64)
        stringI(i) = 27;
    end
    tempMatrix(i) = stringI(i);
end
fprintf("The coding snippet from line 51 to 60 converts the characters into integers and pads the necessary spaces by using for loop and in-built functions such as ceil().\n")
tempMatrix = reshape(tempMatrix, 4, numCols);
fprintf("Now, we use reshape function to convert the array of integers into desired matrix and the result is:")
tempMatrix
fprintf("Now to encode the matrix, we multiply the matrix with the encoding matrix(B), and the result is:")
encodedMatrix = B * tempMatrix;
encodedMatrix
fprintf("Now, we reshape the matrix into one dimensional array and the result is: \n")
encodedMatrix = reshape(encodedMatrix, 1, numCols*4);
encodedMatrix
fprintf("\n")

fprintf("3b) \n\n")
fprintf("This is the encoded array \n\n")
m1 = [16, 91, -31, 69, -92, -81, 272, -347, -50, -23, 161, -191, -62, -18, 178, -221, -40, 28, 127, -140, -86, -59, 251, -317, -88, -69, 252, -325]
fprintf("To decode this array, first we have to reshape this into a matrix with proper dimesnion.")
lengthm1 = length(m1);
m1 = reshape(m1, 4, (length(m1))/4);
fprintf("Line 77 and 78 shapes it into a matrix form and the result is:")
m1
fprintf("Now to decode this matrix, we multiply the inverse of the encoding matrix with this matrix and reshape and convert it into array of characters.\n\n")
origMessage = inv(B) * m1;
origMessage = reshape(origMessage, 1, lengthm1);
for i = 1:(lengthm1) 
    if (origMessage(i)== 27)
        origMessage(i) = -64;
    end
    origMessage(i) = origMessage(i) + 96;
end
fprintf("Line 82-line 89 does that using a for loop. And the result is: \n")
char(origMessage)
fprintf("To get rid of the spaces at the end, a back slider for loop is created to remove that spaces. Line 93-line 103 does the job. And the final decoded result is:\n")
a = 0;
for i = lengthm1:-1:(lengthm1-3)
    if(origMessage(i) == 32)
        a = a + 1;
        if(origMessage(i-1) ~= 32)
            break;
        end
    end
end
origMessage = origMessage(1:(lengthm1 -a));
char(origMessage)

fprintf("We follow the same commands to complete the decoding of matrix m2:")
m2 = [-48, -58, 131, -178, -11, 67, 45, -29, -75, -117, 226, -299, -43, 15, 121, -145,-80, -97, 223, -301, 6, 29, -20, 29, -19, 5, 39, -57, -103, -71, 309, -385]
lengthm2 = length(m2);
m2 = reshape(m2, 4, (length(m2))/4);
origMessage2 = inv(B) * m2;
origMessage2 = reshape(origMessage2, 1, lengthm2);
for i = 1:(lengthm2) 
    if (origMessage2(i)== 27)
        origMessage2(i) = -64;
    end
    origMessage2(i) = origMessage2(i) + 96;
end
char(origMessage2);
a = 0;
for i = lengthm2:-1:(lengthm2-3)
    if(origMessage2(i) == 32)
        a = a + 1;
        if(origMessage2(i-1) ~= 32)
            break;
        end
    end
end
origMessage2 = origMessage2(1:(lengthm2 -a));
fprintf("And the result of decoded message of m2 is: \n")
char(origMessage2)
fprintf("The given matrix to us is:")
C = [6 2 0 1;3 1 0 2;0 3 2 0; 0 0 0 -7]
fprintf("\n")
fprintf("For the matrix to function as an encoding matrix, it must be invertible because the inverse matrix is the matrix that decodes the encrypted message:\n\n")
fprintf("So, we proceed to check the determinant of the matrix. And the result is:")
determinant = det(C)
fprintf("Since the matrix has determinant zero, it is singular and non-invertible. Therefore, the matrix C can't be an encoding matrix. \n\n")
