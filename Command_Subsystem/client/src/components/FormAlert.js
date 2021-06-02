import React from "react";
import { Alert, Button } from "react-bootstrap";

const FormAlert = (props) => {
  const handleOnClick = () => {
    props.setShow(false);
    props.setErrors({});
  };

  return (
    <React.Fragment>
      {props.valid === true ? (
        <Alert show={props.show} variant="success">
          <Alert.Heading>Success!!</Alert.Heading>
          <p>Your commands are being sent to the rover :></p>
          <hr />
          <div className="d-flex justify-content-end">
            <Button onClick={() => handleOnClick()} variant="outline-success">
              Ok bye!
            </Button>
          </div>
        </Alert>
      ) : (
        <Alert show={props.show} variant="danger">
          <Alert.Heading>Something went wrong!!</Alert.Heading>
          {Object.keys(props.errors).map((data, i) => (
            <p key={i}>{props.errors[data]}</p>
          ))}
          <hr />
          <div className="d-flex justify-content-end">
            <Button onClick={() => handleOnClick()} variant="outline-danger">
              Ok bye!
            </Button>
          </div>
        </Alert>
      )}
    </React.Fragment>
  );
};

export default FormAlert;
