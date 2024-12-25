import React from "react";
import PropTypes from "prop-types";
import {I18nProvider} from "../../Components/i18n/I18nProvider";

export const NewPatient = () => {
  return (
    <I18nProvider>
      <div>NewPatient</div>
    </I18nProvider>
  );
};

NewPatient.propTypes = {
  hostData: PropTypes.object,
  hostApi: PropTypes.object,
};
