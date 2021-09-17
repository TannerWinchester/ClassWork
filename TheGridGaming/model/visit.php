<?php
/****************************************************/
/* DATE             NAME                    DESCRIPTION
 * --------------------------------------------------
 * 9/17/2021    TANNER WINCHESTER   INITIAL DEPLOYMENT OF VISIT FUNCTIONS
 ****************************************************/

function getVisitByEmp($employee_id) {
       $db = Database::getDB();
    $query2 = 'SELECT msg_id, contactMSG.first_name, contactMSG.last_name, contactMSG.email_address, contactMSG.question, contactMSG.phone_num, contactMSG.employee_id
    FROM contactMSG
    JOIN employee on contactMSG.employee_id = employee.employee_id
    WHERE employee.employee_id = :employee_id';

        $statement2 = $db->prepare($query2);
        $statement2->bindValue(":employee_id", $employee_id);
        $statement2->execute();
        $visits = $statement2;
        
        return $visits;
}

function delVisit($visit_id) {
    $db = Database::getDB();
    $visit_id = filter_input(INPUT_POST, 'visit_id', FILTER_VALIDATE_INT);
    $query = 'DELETE FROM contactMSG WHERE msg_id = :visit_id';
    $statement = $db->prepare($query);
    $statement->bindValue(":visit_id", $visit_id);
    $statement->execute();
    $statement->closeCursor();
}

function addVisit($fname, $lname, $email, $phone, $reference, $esports, $hyper, $arcade, $members, $comments) {
    $db = Database::getDB();
    $query = 'INSERT INTO contactMSG
	(first_name, last_name, email_address, phone_num, referral_src, is_sports, is_reality, is_member, is_arcade, question, employee_id)
            VALUES
                (:fname, :lname, :email, :phone, :reference, :esports, :hyper, :members, :arcade, :comments, 1)';
            $statement = $db->prepare($query);
            $statement->bindValue(':fname', $fname);
            $statement->bindValue(':lname', $lname);
            $statement->bindValue(':email', $email);
            $statement->bindValue(':phone', $phone);
            $statement->bindValue(':reference', $reference);
            $statement->bindValue(':esports', $esports);
            $statement->bindValue(':hyper', $hyper);
            $statement->bindValue(':arcade', $arcade);
            $statement->bindValue(':members', $members);
            $statement->bindValue(':comments', $comments);
            $statement->execute();
            $statement->closeCursor();
}
?>
