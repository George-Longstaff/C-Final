%% Team 13 Harrison Dom George
%% 2/27/2024
%% mental health app
%% explanation of the app
%{
Our app contains 3 distinct features to assits with the user's current
mental state
Our first features is a way to provide the user with quick helpful tips to
improve their immediate mental state also with a cheerful picture of soem
puppies
Our second feature provides the user with some helpful information on a
couple of the resources located around campus to assist with their mental
health
Our third feature provides a fun game for the user to distress on without
any negative concequences from a "loss" to positively reinforce their
mental health 
Our app first opens with a brief welcome and then a series of menus to
ensure no user input error and ease of use. We condensed our main code into
a function itself so that it is easier to run again and give the appearence
of an everyday app that has seemless transitions between it's own features

%}

%% house keepings
clc;
clear;
close all;


Header() %% displays a welcome to our app
disp(' ')

[choice1]=featureselect();

        
       


% header of a welcome to our app
        function[]=Header()
        disp("Welcome to the one stop shop for your mental health, choose from symptom-solution matching, information on mental health resources on campus, and a fun game to boost your mental health!")
        end
        
        % function to run each feature, included entirely in a function so
        % that it can be run again much easier
        function[choice1]=featureselect()
        choice1=menu('choose which feature you would like to try', 'symptom-solution','information on resources','mental health game');
        switch choice1
    case 1
        [f]=symptom();
        if f==1 %% switch to the emotion the user is feeling
       
        q="depression";
        disp("I am sorry to hear you are dealing with depression today.")
        disp("Here are some tips to help make you feel better.")
        disp("Get outside and go for a walk.")
        disp("Make sure you eat and drink a lot of water.")

        elseif f==2
        q="anxiety";
        disp("I am sorry to hear you are dealing with anxiety today.")
        disp("Here are some tips to help make you feel better.")
        disp("Take deep breaths.")
        disp("Realize this feeling is temporary and it will go away with time.")
        disp("Watch a movie or distract yourself so you can not think of this anxiety.")

        elseif f==3
        q="stress";
        disp("I am sorry to hear you are dealing with stress today.")
        disp("Here are some tips to help make you feel better.")
        disp("Get out to your local dog park and pet some dogs.")
        disp("Go to the gym and lift some weights.")
        disp("Read a book and drink some tea to relax.")
        end
        %% displaying the picture
        disp(horzcat("I hope this helps with your "+q+"."))
        figure(1)
        title("Here is an image to help you feel better.")
        x=imread("dogs.jpeg");
        imshow(x)
        [choice1]=featureselect();
    case 2
    
    selectanother = 1;
    while selectanother == 1
        clc;
    [choice2]=resourceselect();
    switch choice2
        case 1 % text blurb for counseling
            disp("You want to learn more about the counseling resources on campus?")
            disp(' ')
            disp('The counseling office is located at 119 University Pl, right next to Nordenburg Hall')
            disp('Monday through Friday they have drop inhours from 9 am to 4 pm')
            disp('There are many different meeting plans outlined on the counseling center website')
            disp('If you are experiencing an emergency, the 24hr crisis response line is 412-648-7930')
            disp(' ')

            selectanother = menu("Would you like to select another resource to learn about?","Yes","No");
           
        case 2 %test blurb for therapy dogs
            disp("You want to learn more about the therapy dogs on campus?")
            disp(' ')
            disp("You should follow therapydogtuesdays on instagram to see when events are")
            disp("Every tuesday at 7pm in Cathy the therapy dogs are there for your mental health needs")
            disp("If you have any direct questions, you can email therapydogspitt@gmail.com")
            disp("you might also catch them around campus at different events or on their daily walks")
            disp(" ")
            selectanother = menu("Would you like to select another resource to learn about?","Yes","No");
            
    end
    end
    [choice1]=featureselect();
        

    %% feature 3
    case 3
        clc;
        goagain = 1;
        points = 100;
        disp("you have selected the mental health game, lets play!")
        disp('to play: you will be given two cards and you want to get as close to 21 as you can without going over, the dealer will get the ')
        disp('same chance,then whoever is closer wins, but for the player there is nothing at stake, just time to relax and play a fun game!')
        pause(14);
        while goagain == 1 %% while loop for playing the game again
        clc;
        disp("you have "+num2str(points)+" points")
        [P1,P2,D1,D2,PT,DT] = dealcards(); %% simuates dealing the cards
        [status]=cardcheck(PT); %% makes sure cards are within playing range and redeals if not
        while status == 0
            [P1,P2,D1,D2,PT,DT] = dealcards();
        end
        disp("player shows a "+num2str(PT))
        disp("Dealer shows a "+num2str(DT))
        pause(1) %% pauses throughout seem to help matlab catch up with menu creation and not crashing
        choice3 = menu("would you like to hit or stay? ", "hit", "stay");
        switch choice3
            case 1
                PT = PT + randi(13);
                disp("player shows a "+num2str(PT))
                [status]=cardcheck(PT);
                pause(1)
        end
        disp("player sticks with a "+num2str(PT))
        disp("dealer needs to hit now")
        DT = DT +10; %% fixed values so that the player almost always will win
        disp("dealer has "+num2str(DT))
        pause(1)
        [points]=gameend(status,points);
        goagain = menu("would you like to play again?", "yes", "no");
        end
        [choice1]=featureselect();
end
        end
        % menu choice for first feature
        function[f]=symptom()
        f=menu("What mental health problems are you dealing with today","Depression","Anxiety","Stress");
        end
% menu choice for second feature
        function[choice2]=resourceselect()
        choice2 = menu('Which resource for mental health are you interested in learning more about?', 'counseling', 'therapy dogs');
        end
% game points checker for a win or a loss
        function[points]=gameend(status,points)
            if status ==0
                disp("Player does not win the had but loses no points")
                points = points +0;
                
            end
            if status == 1
                disp("player wins! +15 points")
                points = points +15;
                
            end
        end
        % dealing the cards function
function [P1,P2,D1,D2,PT,DT] = dealcards()
    P1 = randi(13);
    P2 = randi(13);
    D1 = randi(13);
    D2 = 16 - D1;
    PT = P1 + P2;
    DT = D1 + D2;
end
% checking for a win or a loss based on card addition value also is used to
% make sure initial deal is valid and not an auto-loss
function[status]=cardcheck(PT)
    if PT <= 21
        status = 1;
    else 
        status = 0;
    end
end

    
        


