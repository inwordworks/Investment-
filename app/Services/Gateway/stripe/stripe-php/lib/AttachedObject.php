<?php

namespace StripeJS;

/**
 * Class AttachedObject
 *
 * e.g. metadata on StripeJS objects.
 *
 * @package StripeJS
 */
class AttachedObject extends StripeJSObject
{
    /**
     * Updates this object.
     *
     * @param array $properties A mapping of properties to update on this object.
     */
    public function replaceWith($properties)
    {
        $removed = array_diff(array_keys($this->_values), array_keys($properties));
        // Don't unset, but rather set to null so we send up '' for deletion.
        foreach ($removed as $k) {
            $this->$k = null;
        }

        foreach ($properties as $k => $v) {
            $this->$k = $v;
        }
    }
}
