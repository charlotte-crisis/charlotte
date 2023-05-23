using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraFollow : MonoBehaviour
{

    public Transform target;

    void LateUpdate()
    {
        if (target != null)
        {
            Vector3 targetPosition = target.position;
            targetPosition.z = transform.position.z;  // Maintain the camera's original z position
            transform.position = targetPosition;
        }
    }

}
