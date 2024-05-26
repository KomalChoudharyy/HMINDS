-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2024 at 01:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cee_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_acc`
--

CREATE TABLE `admin_acc` (
  `admin_id` int(11) NOT NULL,
  `admin_user` varchar(1000) NOT NULL,
  `admin_pass` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_acc`
--

INSERT INTO `admin_acc` (`admin_id`, `admin_user`, `admin_pass`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_tbl`
--

CREATE TABLE `course_tbl` (
  `cou_id` int(11) NOT NULL,
  `cou_name` varchar(1000) NOT NULL,
  `cou_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `course_tbl`
--

INSERT INTO `course_tbl` (`cou_id`, `cou_name`, `cou_created`) VALUES
(69, '10TH', '2024-05-07 10:48:10'),
(70, '12TH', '2024-05-07 10:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `examinee_tbl`
--

CREATE TABLE `examinee_tbl` (
  `exmne_id` int(11) NOT NULL,
  `exmne_fullname` varchar(1000) NOT NULL,
  `exmne_course` varchar(1000) NOT NULL,
  `exmne_gender` varchar(1000) NOT NULL,
  `exmne_birthdate` varchar(1000) NOT NULL,
  `exmne_email` varchar(1000) NOT NULL,
  `exmne_password` varchar(1000) NOT NULL,
  `exmne_status` varchar(1000) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `examinee_tbl`
--

INSERT INTO `examinee_tbl` (`exmne_id`, `exmne_fullname`, `exmne_course`, `exmne_gender`, `exmne_birthdate`, `exmne_email`, `exmne_password`, `exmne_status`) VALUES
(4, 'Anish', '69', 'male', '2019-11-15', 'anish@gmail.com', 'anish', 'active'),
(5, 'Komal', '70', 'female', '2019-11-14', 'komal@gmail.com', 'komal', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `exam_answers`
--

CREATE TABLE `exam_answers` (
  `exans_id` int(11) NOT NULL,
  `axmne_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `exans_answer` varchar(1000) NOT NULL,
  `exans_status` varchar(1000) NOT NULL DEFAULT 'new',
  `exans_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `exam_answers`
--

INSERT INTO `exam_answers` (`exans_id`, `axmne_id`, `exam_id`, `quest_id`, `exans_answer`, `exans_status`, `exans_created`) VALUES
(295, 4, 12, 25, 'Diode, inverted, pointer', 'old', '2019-12-07 02:52:14');

-- --------------------------------------------------------

--
-- Table structure for table `exam_attempt`
--

CREATE TABLE `exam_attempt` (
  `examat_id` int(11) NOT NULL,
  `exmne_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `examat_status` varchar(1000) NOT NULL DEFAULT 'used'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `exam_attempt`
--

INSERT INTO `exam_attempt` (`examat_id`, `exmne_id`, `exam_id`, `examat_status`) VALUES
(51, 6, 12, 'used');

-- --------------------------------------------------------

--
-- Table structure for table `exam_question_tbl`
--

CREATE TABLE `exam_question_tbl` (
  `eqt_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `exam_question` varchar(1000) NOT NULL,
  `exam_ch1` varchar(1000) NOT NULL,
  `exam_ch2` varchar(1000) NOT NULL,
  `exam_ch3` varchar(1000) NOT NULL,
  `exam_ch4` varchar(1000) NOT NULL,
  `exam_answer` varchar(1000) NOT NULL,
  `exam_status` varchar(1000) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `exam_question_tbl`
--

INSERT INTO `exam_question_tbl` (`eqt_id`, `exam_id`, `exam_question`, `exam_ch1`, `exam_ch2`, `exam_ch3`, `exam_ch4`, `exam_answer`, `exam_status`) VALUES
(1, 25, 'When facing a difficult problem, I usually:', 'Try to solve it on my own.', 'Seek help from friends or family.', ' Ignore it and hope it goes away.', 'Feel overwhelmed and give up.', 'Try to solve it on my own.', 'active'),
(2, 25, 'When I\'m stressed, I tend to:', 'Exercise or engage in physical activity.', 'Talk to someone about my feelings.', 'Eat junk food or snacks.', 'Retreat into my own thoughts and emotions.', 'Talk to someone about my feelings.', 'active'),
(3, 25, 'In social situations, I am more likely to:', 'Initiate conversations with new people.', 'Listen quietly and observe others.', 'Stick with my close friends.', 'Feel anxious and uncomfortable.', 'Feel anxious and uncomfortable.', 'active'),
(4, 25, 'When making decisions, I rely more on:', 'Logic and reason.', 'Intuition and gut feelings.', 'Advice from others.', 'Procrastination.', 'Logic and reason.', 'active'),
(5, 25, 'My approach to studying for exams is usually:', 'Creating a detailed study schedule and sticking to it.', 'Reviewing notes and textbooks multiple times.', 'Cramming the night before the exam.', 'Avoiding studying until the last minute.', 'Creating a detailed study schedule and sticking to it.', 'active'),
(6, 25, 'When I encounter a setback or failure, I tend to:', 'Learn from my mistakes and try again.', 'Blame external factors or other people.', 'Feel discouraged and give up.', 'Pretend it didn\'t happen and move on.', 'Pretend it didn\'t happen and move on.', 'active'),
(7, 25, 'In group projects, I prefer to:', 'Take on a leadership role and organize the team.', 'Contribute my ideas and collaborate with others.', 'Let others take charge and follow their lead.', 'Avoid group projects altogether.', 'Contribute my ideas and collaborate with others.', 'active'),
(8, 25, 'When I\'m feeling down, I find comfort in:', 'Spending time with loved ones.', 'Engaging in hobbies or activities I enjoy.', 'Distracting myself with TV or social media.', 'Bottling up my emotions and pretending everything is fine.', 'Engaging in hobbies or activities I enjoy.', 'active'),
(9, 25, 'When faced with criticism, I am more likely to:', 'Reflect on it and consider if there\'s truth to it.', 'Get defensive and argue against it.', 'Ignore it and move on.', 'Feel deeply hurt and upset.', 'Reflect on it and consider if there\'s truth to it.', 'active'),
(10, 25, 'My attitude towards challenges is generally:', 'Positive—I see them as opportunities for growth.', 'Neutral—I take them as they come.', 'Negative—I feel overwhelmed by them.', 'Avoidant—I try to avoid challenges whenever possible.', 'Positive—I see them as opportunities for growth.', 'active'),
(11, 25, 'When facing a difficult problem, I usually:', 'Seek advice from multiple sources before deciding.', 'Trust my instincts and go with my gut feeling.', 'Analyze the situation carefully before taking action.', 'Avoid making decisions altogether.', 'Trust my instincts and go with my gut feeling.', 'active'),
(12, 25, 'When I\'m stressed, I tend to:', 'Seek out activities that relax me, like listening to music or taking a bath.', 'Write down my thoughts and feelings in a journal.', 'Retreat from others and spend time alone.', 'Engage in risky behaviors to distract myself.', 'Seek out activities that relax me, like listening to music or taking a bath.', 'active'),
(13, 25, 'In social situations, I am more likely to:', 'Take charge and organize group activities.', 'Listen attentively and empathize with others.', 'Keep to myself and observe from a distance.', 'Feel anxious and self-conscious.', 'Listen attentively and empathize with others.', 'active'),
(14, 25, 'When faced with a setback, I tend to:', 'Persevere and keep pushing forward.', 'Feel discouraged and consider giving up.', 'Blame external factors or other people for the setback.', 'Pretend the setback didn\'t happen and move on quickly.', 'Persevere and keep pushing forward.', 'active'),
(15, 25, 'My response to peer pressure is usually:', 'Resisting—I\'m comfortable making my own decisions.', 'Giving in—I don\'t like conflict and want to fit in.', 'Ignoring it—I don\'t really care what others think.', 'Feeling unsure and seeking guidance from others.', 'Resisting—I\'m comfortable making my own decisions.', 'active'),
(16, 25, 'When feeling anxious or stressed, I find it helpful to:', 'Practice deep breathing exercises or mindfulness techniques.', 'Talk to someone I trust about my feelings.', 'Distract myself with activities like listening to music or watching TV.', 'Bottle up my feelings and try to ignore them.', 'Distract myself with activities like listening to music or watching TV.', 'active'),
(17, 25, 'My approach to managing conflicts with others is usually:', 'Addressing the issue directly and seeking resolution.', 'Avoiding confrontation and hoping the problem resolves itself.', 'Seeking mediation or assistance from a third party.', 'Ending the relationship or cutting ties with the person involved.', 'Seeking mediation or assistance from a third party.', 'active'),
(18, 25, 'When learning a new skill, I prefer:', 'Hands-on practice and experimentation.', 'Reading instructions or watching tutorials.', 'Having someone teach me directly.', 'Figuring it out by myself through trial and error.', 'Hands-on practice and experimentation.', 'active'),
(19, 25, 'My response to failure is usually:', 'Using it as a learning opportunity and trying again.', 'Feeling discouraged and giving up.', 'Blaming external factors or others for my failure.', 'Ignoring it and moving on without reflecting.', 'Using it as a learning opportunity and trying again.', 'active'),
(20, 25, 'When faced with a challenge, I tend to:', 'Break it down into smaller, manageable tasks.', 'Feel overwhelmed and unsure where to start.', 'Seek advice or guidance from others.', 'Avoid the challenge altogether if possible.', 'Break it down into smaller, manageable tasks.', 'active'),
(21, 25, 'My attitude towards change is generally:', 'Positive—I embrace change as an opportunity for growth.', 'Negative—I prefer stability and dislike change.', 'Neutral—I\'m indifferent to change either way.', 'Dependent on the specific circumstances.', 'Positive—I embrace change as an opportunity for growth.', 'active'),
(22, 25, 'When feeling stressed, I find relief in:', 'Physical activity or exercise.', 'Relaxation techniques like deep breathing or meditation.', 'Distracting myself with hobbies or activities.', 'Talking to someone about my feelings.', 'Distracting myself with hobbies or activities.', 'active'),
(23, 25, 'In group activities, I typically:', 'Take charge and delegate tasks to others.', 'Contribute my ideas and collaborate with the group.', 'Let others take the lead and follow their direction.', 'Prefer to work alone to avoid conflicts.', 'Contribute my ideas and collaborate with the group.', 'active'),
(24, 25, 'My approach to problem-solving involves:', 'Analyzing the problem and considering various solutions.', 'Going with my gut instinct and making a quick decision.', 'Seeking input or advice from others before deciding.', 'Avoiding problems or hoping they resolve themselves.', 'Analyzing the problem and considering various solutions.', 'active'),
(25, 25, 'When feeling upset, I prefer to:', 'Express my emotions openly and seek support from others.', 'Keep my feelings to myself and process them internally.', 'Distract myself with activities or hobbies.', 'Retreat from others and be alone until I feel better.', 'Express my emotions openly and seek support from others.', 'active'),
(26, 25, 'My response to criticism is typically:', 'Considering the feedback and using it constructively.', 'Getting defensive and justifying my actions.', 'Ignoring the criticism and not letting it affect me.', 'Feeling hurt and taking the criticism personally.', 'Considering the feedback and using it constructively.', 'active'),
(27, 26, 'When facing a difficult problem, I usually:', 'Try to solve it on my own.', 'Seek help from friends or family.', ' Ignore it and hope it goes away.', 'Feel overwhelmed and give up.', 'Try to solve it on my own.', 'active'),
(28, 26, 'When I\'m stressed, I tend to:', 'Exercise or engage in physical activity.', 'Talk to someone about my feelings.', 'Eat junk food or snacks.', 'Retreat into my own thoughts and emotions.', 'Talk to someone about my feelings.', 'active'),
(29, 26, 'In social situations, I am more likely to:', 'Initiate conversations with new people.', 'Listen quietly and observe others.', 'Stick with my close friends.', 'Feel anxious and uncomfortable.', 'Feel anxious and uncomfortable.', 'active'),
(30, 26, 'When making decisions, I rely more on:', 'Logic and reason.', 'Intuition and gut feelings.', 'Advice from others.', 'Procrastination.', 'Logic and reason.', 'active'),
(31, 26, 'My approach to studying for exams is usually:', 'Creating a detailed study schedule and sticking to it.', 'Reviewing notes and textbooks multiple times.', 'Cramming the night before the exam.', 'Avoiding studying until the last minute.', 'Creating a detailed study schedule and sticking to it.', 'active'),
(32, 26, 'When I encounter a setback or failure, I tend to:', 'Learn from my mistakes and try again.', 'Blame external factors or other people.', 'Feel discouraged and give up.', 'Pretend it didn\'t happen and move on.', 'Pretend it didn\'t happen and move on.', 'active'),
(33, 26, 'In group projects, I prefer to:', 'Take on a leadership role and organize the team.', 'Contribute my ideas and collaborate with others.', 'Let others take charge and follow their lead.', 'Avoid group projects altogether.', 'Contribute my ideas and collaborate with others.', 'active'),
(34, 26, 'When I\'m feeling down, I find comfort in:', 'Spending time with loved ones.', 'Engaging in hobbies or activities I enjoy.', 'Distracting myself with TV or social media.', 'Bottling up my emotions and pretending everything is fine.', 'Engaging in hobbies or activities I enjoy.', 'active'),
(35, 26, 'When faced with criticism, I am more likely to:', 'Reflect on it and consider if there\'s truth to it.', 'Get defensive and argue against it.', 'Ignore it and move on.', 'Feel deeply hurt and upset.', 'Reflect on it and consider if there\'s truth to it.', 'active'),
(36, 26, 'My attitude towards challenges is generally:', 'Positive—I see them as opportunities for growth.', 'Neutral—I take them as they come.', 'Negative—I feel overwhelmed by them.', 'Avoidant—I try to avoid challenges whenever possible.', 'Positive—I see them as opportunities for growth.', 'active'),
(37, 26, 'When facing a difficult problem, I usually:', 'Seek advice from multiple sources before deciding.', 'Trust my instincts and go with my gut feeling.', 'Analyze the situation carefully before taking action.', 'Avoid making decisions altogether.', 'Trust my instincts and go with my gut feeling.', 'active'),
(38, 26, 'When I\'m stressed, I tend to:', 'Seek out activities that relax me, like listening to music or taking a bath.', 'Write down my thoughts and feelings in a journal.', 'Retreat from others and spend time alone.', 'Engage in risky behaviors to distract myself.', 'Seek out activities that relax me, like listening to music or taking a bath.', 'active'),
(39, 26, 'In social situations, I am more likely to:', 'Take charge and organize group activities.', 'Listen attentively and empathize with others.', 'Keep to myself and observe from a distance.', 'Feel anxious and self-conscious.', 'Listen attentively and empathize with others.', 'active'),
(40, 26, 'When faced with a setback, I tend to:', 'Persevere and keep pushing forward.', 'Feel discouraged and consider giving up.', 'Blame external factors or other people for the setback.', 'Pretend the setback didn\'t happen and move on quickly.', 'Persevere and keep pushing forward.', 'active'),
(41, 26, 'My response to peer pressure is usually:', 'Resisting—I\'m comfortable making my own decisions.', 'Giving in—I don\'t like conflict and want to fit in.', 'Ignoring it—I don\'t really care what others think.', 'Feeling unsure and seeking guidance from others.', 'Resisting—I\'m comfortable making my own decisions.', 'active'),
(42, 26, 'When feeling anxious or stressed, I find it helpful to:', 'Practice deep breathing exercises or mindfulness techniques.', 'Talk to someone I trust about my feelings.', 'Distract myself with activities like listening to music or watching TV.', 'Bottle up my feelings and try to ignore them.', 'Distract myself with activities like listening to music or watching TV.', 'active'),
(43, 26, 'My approach to managing conflicts with others is usually:', 'Addressing the issue directly and seeking resolution.', 'Avoiding confrontation and hoping the problem resolves itself.', 'Seeking mediation or assistance from a third party.', 'Ending the relationship or cutting ties with the person involved.', 'Seeking mediation or assistance from a third party.', 'active'),
(44, 26, 'When learning a new skill, I prefer:', 'Hands-on practice and experimentation.', 'Reading instructions or watching tutorials.', 'Having someone teach me directly.', 'Figuring it out by myself through trial and error.', 'Hands-on practice and experimentation.', 'active'),
(45, 26, 'My response to failure is usually:', 'Using it as a learning opportunity and trying again.', 'Feeling discouraged and giving up.', 'Blaming external factors or others for my failure.', 'Ignoring it and moving on without reflecting.', 'Using it as a learning opportunity and trying again.', 'active'),
(46, 26, 'When faced with a challenge, I tend to:', 'Break it down into smaller, manageable tasks.', 'Feel overwhelmed and unsure where to start.', 'Seek advice or guidance from others.', 'Avoid the challenge altogether if possible.', 'Break it down into smaller, manageable tasks.', 'active'),
(47, 26, 'My attitude towards change is generally:', 'Positive—I embrace change as an opportunity for growth.', 'Negative—I prefer stability and dislike change.', 'Neutral—I\'m indifferent to change either way.', 'Dependent on the specific circumstances.', 'Positive—I embrace change as an opportunity for growth.', 'active'),
(48, 26, 'When feeling stressed, I find relief in:', 'Physical activity or exercise.', 'Relaxation techniques like deep breathing or meditation.', 'Distracting myself with hobbies or activities.', 'Talking to someone about my feelings.', 'Distracting myself with hobbies or activities.', 'active'),
(49, 26, 'In group activities, I typically:', 'Take charge and delegate tasks to others.', 'Contribute my ideas and collaborate with the group.', 'Let others take the lead and follow their direction.', 'Prefer to work alone to avoid conflicts.', 'Contribute my ideas and collaborate with the group.', 'active'),
(50, 26, 'My approach to problem-solving involves:', 'Analyzing the problem and considering various solutions.', 'Going with my gut instinct and making a quick decision.', 'Seeking input or advice from others before deciding.', 'Avoiding problems or hoping they resolve themselves.', 'Analyzing the problem and considering various solutions.', 'active'),
(51, 26, 'When feeling upset, I prefer to:', 'Express my emotions openly and seek support from others.', 'Keep my feelings to myself and process them internally.', 'Distract myself with activities or hobbies.', 'Retreat from others and be alone until I feel better.', 'Express my emotions openly and seek support from others.', 'active'),
(52, 26, 'My response to criticism is typically:', 'Considering the feedback and using it constructively.', 'Getting defensive and justifying my actions.', 'Ignoring the criticism and not letting it affect me.', 'Feeling hurt and taking the criticism personally.', 'Considering the feedback and using it constructively.', 'active');



--
-- Table structure for table `exam_tbl`
--

CREATE TABLE `exam_tbl` (
  `ex_id` int(11) NOT NULL,
  `cou_id` int(11) NOT NULL,
  `ex_title` varchar(1000) NOT NULL,
  `ex_time_limit` varchar(1000) NOT NULL,
  `ex_questlimit_display` int(11) NOT NULL,
  `ex_description` varchar(1000) NOT NULL,
  `ex_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `exam_tbl`
--

INSERT INTO `exam_tbl` (`ex_id`, `cou_id`, `ex_title`, `ex_time_limit`, `ex_questlimit_display`, `ex_description`, `ex_created`) VALUES
(25, 69, '10TH', '10', 5, 'Psychometric', '2024-05-14 19:39:45'),
(26, 70, '12TH', '10', 5, 'CARRIER', '2024-05-14 23:05:35');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks_tbl`
--

CREATE TABLE `feedbacks_tbl` (
  `fb_id` int(11) NOT NULL,
  `exmne_id` int(11) NOT NULL,
  `fb_exmne_as` varchar(1000) NOT NULL,
  `fb_feedbacks` varchar(1000) NOT NULL,
  `fb_date` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `feedbacks_tbl`
--

INSERT INTO `feedbacks_tbl` (`fb_id`, `exmne_id`, `fb_exmne_as`, `fb_feedbacks`, `fb_date`) VALUES
(4, 4, 'Anish', 'test', 'April 05, 2024'),
(5, 5, 'Anonymous', 'Hello world!', 'April 05, 2024');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_acc`
--
ALTER TABLE `admin_acc`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_tbl`
--
ALTER TABLE `course_tbl`
  ADD PRIMARY KEY (`cou_id`);

--
-- Indexes for table `examinee_tbl`
--
ALTER TABLE `examinee_tbl`
  ADD PRIMARY KEY (`exmne_id`);

--
-- Indexes for table `exam_answers`
--
ALTER TABLE `exam_answers`
  ADD PRIMARY KEY (`exans_id`);

--
-- Indexes for table `exam_attempt`
--
ALTER TABLE `exam_attempt`
  ADD PRIMARY KEY (`examat_id`);

--
-- Indexes for table `exam_question_tbl`
--
ALTER TABLE `exam_question_tbl`
  ADD PRIMARY KEY (`eqt_id`);

--
-- Indexes for table `exam_tbl`
--
ALTER TABLE `exam_tbl`
  ADD PRIMARY KEY (`ex_id`);

--
-- Indexes for table `feedbacks_tbl`
--
ALTER TABLE `feedbacks_tbl`
  ADD PRIMARY KEY (`fb_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_acc`
--
ALTER TABLE `admin_acc`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_tbl`
--
ALTER TABLE `course_tbl`
  MODIFY `cou_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `examinee_tbl`
--
ALTER TABLE `examinee_tbl`
  MODIFY `exmne_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `exam_answers`
--
ALTER TABLE `exam_answers`
  MODIFY `exans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322;

--
-- AUTO_INCREMENT for table `exam_attempt`
--
ALTER TABLE `exam_attempt`
  MODIFY `examat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `exam_question_tbl`
--
ALTER TABLE `exam_question_tbl`
  MODIFY `eqt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `exam_tbl`
--
ALTER TABLE `exam_tbl`
  MODIFY `ex_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `feedbacks_tbl`
--
ALTER TABLE `feedbacks_tbl`
  MODIFY `fb_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
